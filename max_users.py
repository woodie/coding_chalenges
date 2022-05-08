#!/usr/bin/env python3

# Write a function which returns the maximum number of concurrent users
# logged in at the same time.

data = [
    {'userId': 1, 'loginTime': 2, 'logoutTime': 5},
    {'userId': 2, 'loginTime': 3, 'logoutTime': 7},
    {'userId': 3, 'loginTime': 3, 'logoutTime': 5},  # added
    {'userId': 4, 'loginTime': 1, 'logoutTime': 10},
    {'userId': 5, 'loginTime': 15, 'logoutTime': 15},
    {'userId': 6, 'loginTime': 14, 'logoutTime': 16}
]
# loginTime: 1, logoutTime: 10   1
# loginTime: 2, logoutTime: 5    2
# loginTime: 3, logoutTime: 5    3
# loginTime: 3, logoutTime: 7    4 <==
# loginTime: 14, logoutTime: 16  1
# loginTime: 15, logoutTime: 15  2


def maximum_number_users(users):
    times = [] # should be a tree
    max_cu = 0
    for node in users:
        times.append(node['logoutTime'])
        for x in times:
            if x < node['loginTime']:
                times.remove(x)
        if len(times) > max_cu:
            max_cu = len(times)
    return max_cu


data.sort(key=lambda i: i['loginTime'])
print(maximum_number_users(data))
