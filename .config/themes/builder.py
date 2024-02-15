import argparse
import yaml
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape


def format_colors(c):
    res = {}
    for k, v in {**c.get("base_16", {}), **c.get("base_30", {})}.items():
        res[f"{k}_hex"] = v.replace("#", "").lower()
    return res


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
    print(template.render(**format_colors(colors)))
