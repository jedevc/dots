import configparser
import hashlib
import os
import shutil
import subprocess
import urllib.request
from pathlib import Path
from typing import Dict, Iterable, Iterator, Optional, Tuple

from .utils import confirm


class Module:
    def __init__(self, config: Path):
        self.path = config.parent

        self.config = configparser.ConfigParser(
            interpolation=configparser.ExtendedInterpolation(),
        )
        self.config.optionxform = lambda option: option  # type: ignore
        self.config.read(config)

        meta = self.section("meta")
        self.name = meta.get("name", self.path.name)
        self.dependencies = []
        for dep in meta.get("dependencies", "").split():
            if dep:
                self.dependencies.append(dep)

        self.contents = FileSet.from_config(self.section("contents"))
        self.symlinks = FileSet.from_config(self.section("symlinks"))
        self.pre_hook = Hook.from_config(self.section("pre-hook"))
        self.post_hook = Hook.from_config(self.section("post-hook"))

    def section(self, key: str) -> Dict[str, str]:
        if key in self.config:
            return dict(self.config[key])
        else:
            return {}

    def resolve_dependencies(self, modules: Dict[str, "Module"]) -> Iterable["Module"]:
        if self.dependencies:
            for dependency in self.dependencies:
                yield from modules[dependency].resolve_dependencies(modules)
                yield modules[dependency]

    def install(self, dest: Path):
        os.makedirs(dest, exist_ok=True)
        if self.pre_hook:
            self.pre_hook.run(dest)

        for dst, src in self.contents.targets(dest, self.path):
            shutil.copy(src, dst)

        for dst, src in self.symlinks.targets(dest, self.path):
            try:
                os.symlink(src, dst)
            except FileExistsError:
                os.remove(dst)
                os.symlink(src, dst)

        if self.post_hook:
            self.post_hook.run(dest)

    def __repr__(self) -> str:
        return f"<Module {self.name}>"


class FileSet:
    def __init__(self, files: Iterable[Tuple[str, str]]):
        self.paths = [(Path(key), Path(value)) for key, value in files]

    @staticmethod
    def from_config(config: Dict[str, str]) -> "FileSet":
        return FileSet(config.items())

    def targets(self, dest: Path, source: Path) -> Iterable[Tuple[Path, Path]]:
        for dst, src in self.paths:
            dest_file = dest / dst
            src_file = source / src
            os.makedirs(dest_file.parent, exist_ok=True)

            yield dest_file, src_file


class Hook:
    def __init__(
        self,
        cmd: Optional[str] = None,
        url: Optional[str] = None,
        hash: Optional[str] = None,
    ):
        self.cmd = cmd
        self.url = url
        self.hash = hash.split(":") if hash else None

    @staticmethod
    def from_config(config: Dict[str, str]) -> Optional["Hook"]:
        if config:
            return Hook(**config)
        else:
            return None

    def run(self, root: Path):
        if self.cmd:
            self.integrity_check(self.cmd)
            subprocess.run(self.cmd, cwd=root, shell=True, check=True)
        if self.url:
            with urllib.request.urlopen(self.url) as response:
                script = response.read()
            self.integrity_check(script)
            print("=" * 80)
            print(self.url)
            print("-" * 80)
            print(script.decode().strip())
            print("=" * 80)
            if confirm("Run script?"):
                print(f"Running {self.url}")
                fname = "/tmp/dots.sh"
                with open(fname, "wb") as f:
                    f.write(script)
                os.chmod(f.name, 0o755)
                subprocess.run([fname], cwd=root, check=True)
                os.remove(fname)
            else:
                print("Hook skipped")

    def integrity_check(self, target: str):
        if not self.hash:
            return

        if isinstance(target, bytes):
            data = target
        elif isinstance(target, str):
            data = target.encode()
        else:
            raise RuntimeError()

        m = hashlib.new(self.hash[0], data)
        if m.hexdigest() != self.hash[1]:
            raise RuntimeError("integrity check failed")


def load_modules(root: Path) -> Iterator[Module]:
    for config in root.glob("**/config.ini"):
        yield Module(config)
