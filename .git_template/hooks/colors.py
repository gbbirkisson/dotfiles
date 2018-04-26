#!/usr/bin/python

colors = {
    'HDR': '\033[95m',
    'OKBL': '\033[94m',
    'OKGR': '\033[92m',
    'WARN': '\033[93m',
    'FAIL': '\033[91m',
    'ENDC': '\033[0m',
    'BOLD': '\033[1m',
    'UNDERLINE': '\033[4m',
}

colors['FAILB'] = colors['FAIL'] + colors['BOLD']
colors['OKGRB'] = colors['OKGR'] + colors['BOLD']
