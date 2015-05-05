# -*- coding: utf-8 -*-
# vi:si:et:sw=4:ts=4

import datetime
import os
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


# detects if we`re working on a django project and load all models to M
if 'DJANGO_SETTINGS_MODULE' in os.environ:
    from django.db.models.loading import get_models

    class DjangoModels(object):
        def __init__(self):
            for m in get_models():
                setattr(self, m.__name__, m)

    M = DjangoModels()
