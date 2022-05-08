#!/usr/bin/env node

const urls = ["https://amazon.com?user=Tim&location=USA",
  "https://google.com?name=tim&page=1&friends=true",
  "https://facebook.com?names[]=tim&names[]=fred",
  "https://netflix.com?user[name]=Erin&user[email]=erin@erin.com&user[paid]=True"];

const params_hash = (url) => {
  out = {};
  pairs = url.split("?");
  for (let pair of pairs[url.split("?").length - 1].split("&")) {
    let [k, v] = pair.split("=");
    if (!isNaN(v)) {
      v = parseInt(v);
    } else if (v.toLowerCase() === "true") {
      v = true;
    } else if (v.toLowerCase() === "false") {
      v = false;
    }
    if (k.endsWith("[]")) {
      k = k.slice(0, -2);
      if (!Array.isArray(out[k])) {
        out[k] = [];
      }
      out[k].push(v);
    } else if (k.endsWith("]")) {
      let [n, s] = k.split("[");
      s = s.slice(0, -1);
      if (typeof out[n] !== "object") {
        out[n] = {};
      }
      out[n][s] = v;
    } else {
      out[k] = v;
    }
  }
  return out;
};

for (let url of urls) {
  console.log(params_hash(url));
}

/*

{ user: 'Tim', location: 'USA' }
{ name: 'tim', page: 1, friends: true }
{ names: [ 'tim', 'fred' ] }
{ user: { name: 'Erin', email: 'erin@erin.com', paid: true } }

{user: "Tim", location: "USA"}
{name: "tim", page: 1, friends: true}
{names: ['tim', 'fred']}
{user: {name: "Erin", email: "erin@erin.com", paid: true } }

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

*/
