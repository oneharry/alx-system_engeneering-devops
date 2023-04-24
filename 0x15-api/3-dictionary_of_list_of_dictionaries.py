#!/usr/bin/python3
"""
Module uses REST API to return information about employee bi ID
Export all employees to json file
"""
import json
import requests
import sys


if __name__ == '__main__':
    url = 'https://jsonplaceholder.typicode.com'
    req = requests.get('{}/users'.format(url))
    users = req.json()
    dic = {}
    for user in users:
        user_id = user.get('id')
        u_req = requests.get('{}/todos?userId={}'.format(url, user_id))
        username = user.get('username')
        tasks = u_req.json()

        all_tasks = []
        for t in tasks:
            data = {"task": t.get('title'), "completed":
                    t.get('completed'), "username": username}
            all_tasks.append(data)
        dic[user_id] = all_tasks
    with open("todo_all_employees.json", 'w') as f:
        json.dump(dic, f)
