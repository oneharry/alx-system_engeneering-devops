#!/usr/bin/python3
"""
Module uses REST API to return information about employee bi ID
"""
import requests
import sys


if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1].isdigit():
        emp_id = sys.argv[1]
        url = 'https://jsonplaceholder.typicode.com'
        req = requests.get('{}/users/{}'.format(url, emp_id))
        tasks_req = requests.get('{}/todos?userId={}'.format(url, emp_id))
        name = req.json()['name']
        tasks = tasks_req.json()
        all_tasks = len(tasks)
        comp_tasks = 0
        for task in tasks:
            if task['completed']:
                comp_tasks += 1
        print("Employee {} is done with tasks({}/{}):"
              .format(name, comp_tasks, all_tasks))
        for task in tasks:
            if task['completed']:
                print(" \t{}".format(task['title']))
