#!/usr/bin/python3
"""
Module uses REST API to return information about employee bi ID
Export to csv file
"""
import csv
import requests
import sys


if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1].isdigit():
        emp_id = sys.argv[1]
        url = 'https://jsonplaceholder.typicode.com'
        req = requests.get('{}/users/{}'.format(url, emp_id))
        tasks_req = requests.get('{}/todos?userId={}'.format(url, emp_id))
        username = req.json()['username']
        tasks = tasks_req.json()
        with open("{}.csv".format(emp_id), 'w', encoding='UTF8') as f:
            writer = csv.writer(f, quoting=csv.QUOTE_ALL)
            for t in tasks:
                data = [t['userId'], username, t['completed'], t['title']]
                writer.writerow(data)
