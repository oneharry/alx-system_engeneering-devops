#!/usr/bin/python3
"""
API call to reddit
"""

import requests


def number_of_subscribers(subreddit):
    """ Returns the number of subcribers for a given subreddit """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0'}
    res = requests.get(url, headers=headers, allow_redirects=False)
    if res.status_code == 200:
        data = res.json()
        return data['data']['subscribers']
    else:
        return 0
