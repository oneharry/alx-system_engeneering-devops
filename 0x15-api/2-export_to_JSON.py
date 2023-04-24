#!/usr/bin/python3
"""
Module uses REST API to return information about employee bi ID
Export to json file
"""
import json
import requests
import sys


if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1].isdigit():
        emp_id = sys.argv[1]
        url = 'https://jsonplaceholder.typicode.com'
        req = requests.get('{}/users/{}'.format(url, emp_id))
        tasks_req = requests.get('{}/todos?userId={}'.format(url, emp_id))
        username = req.json().get('username')
        tasks = tasks_req.json()

        all_tasks = []
        for t in tasks:
            data = {"task": t.get('title'), "completed":
                    t.get('completed'), "username": username}
            all_tasks.append(data)
        json_data = {emp_id: all_tasks}
        with open("{}.json".format(emp_id), 'w') as f:
            json.dump(json_data, f)
