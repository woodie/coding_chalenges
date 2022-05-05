#!/usr/bin/env python3

urls = ["https://amazon.com?user=Tim&location=USA",
        "https://google.com?name=tim&page=1&friends=true",
        "https://facebook.com?names[]=tim&names[]=fred",
        "https://netflix.com?user[name]=Erin&user[email]=erin@erin.com&user[paid]=True"]


def params_hash(url):
    out = {}
    for pair in url.split("?")[-1].split("&"):
        k, v = pair.split("=")
        if v.isnumeric():
            v = int(v)
        elif v.lower() == "true":
            v = True
        elif v.lower() == "false":
            v = False
        if k.endswith("[]"):
            k = k[0:-2]
            if k not in out or not isinstance(out[k], list):
                out[k] = []
            out[k].append(v)
        elif k.endswith("]"):
            k, s = k.split("[")
            s = s[0:-1]
            if k not in out or not isinstance(out[k], dict):
                out[k] = {}
            out[k][s] = v
        else:
            out[k] = v
    return out


for url in urls:
    print(params_hash(url))

"""

{'user': 'Tim', 'location': 'USA'}
{'name': 'tim', 'page': 1, 'friends': True}
{'names': ['tim', 'fred']}
{'user': {'name': 'Erin', 'email': 'erin@erin.com', 'paid': True}}

{ user: "Tim", location: "USA" }
{ name: "tim", page: 1, friends: true }
{ names: ['tim', 'fred'] }
{ user: { name: "Erin", email: "erin@erin.com", paid: true } }

# Write a function/class/method that takes a URL and returns
# a Hash/Map/Object that represents the different query params.

# Here are some examples of what we might need:

# "https://amazon.com?user=Tim&location=USA"
# -> { user: "Tim", location: "USA" }

# "https://google.com?name=tim&page=1&friends=true"
# -> { name: "tim", page: 1, friends: true }

# "https://facebook.com?names[]=tim&names[]=fred"
# -> { names: ['tim', 'fred'] }

# "https://netflix.com?user[name]=Erin&user[email]=erin@erin.com&user[paid]=True"
# -> { user: { name: "Erin", email: "erin@erin.com", paid: true } }

"""
