#!/usr/bin/python3
"""
API call to reddit
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """ recursively return list of titles """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0'}
    params = {'limit': 100, 'after': after}
    response = requests.get(url, headers=headers,
                            params=params, allow_redirects=False)
    if response.status_code == 200:
        data = response.json().get('data')
        for ch in data.get('children'):
            hot_list.append(ch.get('data').get('title'))
        after = data.get('after')
        if after:
            return recurse(subreddit, hot_list, after)
        return hot_list
    else:
        return None
