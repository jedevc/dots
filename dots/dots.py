import argparse
import sys
from pathlib import Path

from .module import load_modules
from .utils import confirm


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    parser_install = subparsers.add_parser("install")
    parser_install.add_argument("-d", "--dest", default=Path.home())
    parser_install.add_argument("targets", nargs="+")
    parser_install.set_defaults(action=action_install)

    parser_list = subparsers.add_parser("list")
    parser_list.set_defaults(action=action_list)

    args = parser.parse_args()
    if hasattr(args, "action"):
        args.action(args)
    else:
        parser.print_usage()


def action_list(args):
    module_root = Path("modules/")
    modules = set()
    for module in load_modules(module_root):
        if module.name in modules:
            print(f"Woops! {module.name} exists in two places!")
            sys.exit(1)
        modules.add(module.name)

    print("Available modules:")
    for module in modules:
        print(f"- {module}")


def action_install(args):
    dest = Path(args.dest)

    module_root = Path("modules/")
    modules = {}
    for module in load_modules(module_root):
        if module.name in modules:
            print(f"Woops! {module.name} exists in two places!")
            sys.exit(1)
        modules[module.name] = module

    try:
        candidates = {modules[target] for target in args.targets}
        dependencies = set()
        for candidate in candidates:
            dependencies |= set(candidate.resolve_dependencies(modules))
        candidates |= dependencies
    except KeyError as e:
        key = e.args[0]
        print(f"{key} module not found")
        sys.exit(1)

    print(f"Will install: {', '.join(c.name for c in candidates)}")
    if not confirm("install?"):
        return

    for mod in candidates:
        print(f"Installing {mod.name}...")
        mod.install(dest)
