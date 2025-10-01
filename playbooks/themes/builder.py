import argparse
import os
from pathlib import Path

import yaml
from jinja2 import Environment, FileSystemLoader, select_autoescape


def setup_env(c):
    env = {}
    # Setup colors
    for k, v in {**c.get("base_16", {}), **c.get("base_30", {})}.items():
        env[f"{k}_hex"] = v.replace("#", "").lower()

    dotfiles = Path(
        os.path.dirname(os.path.realpath(__file__))
    ).parent.parent.absolute()
    env["dotfiles"] = dotfiles

    return env


parser = argparse.ArgumentParser()
parser.add_argument("-t", "--template", required=True)
parser.add_argument("-c", "--colors", type=Path, required=True)
args = parser.parse_args()

with Path.open(args.colors) as stream:
    colors = yaml.safe_load(stream)
    env = Environment(
        loader=FileSystemLoader(searchpath="./"), autoescape=select_autoescape()
    )
    template = env.get_template(args.template)
    print(template.render(**setup_env(colors)))
