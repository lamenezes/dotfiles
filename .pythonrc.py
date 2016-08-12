# -*- coding: utf-8 -*-
# vi:si:et:sw=4:ts=4

import pprint
import readline
import rlcompleter
import sys


# stdout now uses pprint by default
def my_displayhook(value):
    if value is not None:
        try:
            import __builtin__
            __builtin__._ = value
        except ImportError:
            import __builtins__
            __builtins__._ = value

        pprint.pprint(value)

sys.displayhook = my_displayhook


# enables autocomplete with tab by default
readline.parse_and_bind('tab: complete')
