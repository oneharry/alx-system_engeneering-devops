#!/usr/bin/python3
"""
API call to reddit
"""

import requests


def count_words(subreddit, word_list, after=None, counts={}):
    """ Return number of words """
    if not word_list:
        return
    if after is None:
        counts = {}
    headers = {'User-Agent': 'Mozilla/5.0'}
    url = "https://www.reddit.com/r/{}/hot.json?limit=100".format(subreddit)
    if after:
        url += f'&after={after}'
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        return
    data = response.json()['data']
    posts = data['children']
    for post in posts:
        title = post['data']['title']
        for word in word_list:
            if title.lower().count(word.lower()) > 0:
                counts[word.lower()] = counts.get(word.lower(), 0) +
                title.lower().count
                (word.lower())
    if not posts:
        return
    after = data['after']
    count_words(subreddit, word_list, after, counts)
    if after is None:
        sorted_counts = sorted(counts.items(), key=lambda x: (-x[1], x[0]))
        for word, count in sorted_counts:
            print("{}: {}".format(word, count))
