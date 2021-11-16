def confirm(prompt: str, default: bool = True) -> bool:
    if default:
        default_prompt = "[Y/n]"
    else:
        default_prompt = "[y/N]"

    confirmation = input(f"{prompt} {default_prompt} ")
    if confirmation:
        return confirmation[0].lower() == "y"
    else:
        return default
