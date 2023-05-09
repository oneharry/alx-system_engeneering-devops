#!/usr/bin/python3
"""
API call to reddit
"""

import requests


def top_ten(subreddit):
    """ Returns the number of subcribers for a given subreddit """
    url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0'}
    res = requests.get(url, headers=headers, allow_redirects=False)
    if res.status_code == 200:
        data = res.json()
        for post in data['data']['children']:
            print("{}".format(post['data']['title']))
    else:
        print(None)
