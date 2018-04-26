#!/usr/bin/python

import re

allowed_projects = ['BAN', 'PS']


def get_jira_issue(message):
    p = re.compile('^(?P<issue>[A-Z]+-[0-9]+) .*')
    if message is None:
        return None
    m = p.search(message)
    if m is None:
        return None
    m.group('issue')
    issue = m.group(1)
    if issue is None:
        return None
    for a in allowed_projects:
        if issue.startswith(a + '-'):
            return issue
    return None


def get_jira_link(issue):
    return "https://soci80.atlassian.net/browse/{}".format(issue)
