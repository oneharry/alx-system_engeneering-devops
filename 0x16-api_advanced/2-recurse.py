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
        data = response.json()
        if not data['data']['children']:
            return hot_list
        for post in data['data']['children']:
            hot_list.append(post['data']['title'])
        after = data['data']['after']
        return recurse(subreddit, hot_list, after)
    else:
        return None
