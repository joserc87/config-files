"""
Author: Jose Ramon Cano <joserc87@gmail.com>
Inspired partly by https://github.com/fscherf/qtile-config/blob/master/config.py
"""

from libqtile import hook

from lib.keys import ALT, TAB, CTRL, SHIFT, RETURN
from lib.settings import MODKEY, DEFAULT_TERMINAL, APP_LAUNCHER
# from lib.default import layout_deafults

# Parts of the config
from lib.keybindings import keys
from lib.groups import groups
from lib.layouts import layouts
from lib.hooks import *
from lib.mouse import mouse
from lib.screens import screens


def main(qtile):
    pass