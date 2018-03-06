"""
droid

Usage:
  droid hello
  droid -h | --help
  droid --version
  droid create -n <project_name> -t <sdk_target> -p <pkg_name>

Options:
  -h --help                         Show this screen.
  --version                         Show version.

Examples:
  droid hello

Help:
  For help using this tool, please open an issue on the Github repository:
  https://github.com/DanielGunna/AndroidOnRails
"""


from inspect import getmembers, isclass

from docopt import docopt

from . import __version__ as VERSION


def main():
    """Main CLI entrypoint."""
    import droid.commands
    options = docopt(__doc__, version=VERSION)

    # Here we'll try to dynamically match the command the user is trying to run
    # with a pre-defined command class we've already created.
    for (k, v) in options.items():
        if hasattr(droid.commands, k) and v:
            module = getattr(droid.commands, k)
            droid.commands = getmembers(module, isclass)
            command = [command[1] for command in droid.commands if command[0] != 'Base'][0]
            command = command(options)
            command.run()
