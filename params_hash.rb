#!/usr/bin/env ruby

urls = %w[https://amazon.com?user=Tim&location=USA
  https://google.com?name=tim&page=1&friends=true
  https://facebook.com?names[]=tim&names[]=fred
  https://netflix.com?user[name]=Erin&user[email]=erin@erin.com&user[paid]=True]

def params_hash(url)
  out = {}
  url.split("?").last.split("&").each do |pair|
    k, v = pair.split("=")
    if v.to_i.to_s == v
      v = v.to_i
    elsif v.downcase == "true"
      v = true
    elsif v.downcase == "false"
      v = false
    end
    if k.end_with?("[]")
      k = k[0..-3].to_sym
      out[k] = [] unless out[k].is_a?(Array)
      out[k] << v
    elsif k.end_with?("]")
      k, s = k.split("[")
      k = k.to_sym
      s = s[0..-2].to_sym
      out[k] = {} unless out[k].is_a?(Hash)
      out[k][s] = v
    else
      k = k.to_sym
      out[k] = v
    end
  end
  out
end

urls.each do |url|
  puts params_hash(url)
end

__END__

{:user=>"Tim", :location=>"USA"}
{:name=>"tim", :page=>1, :friends=>true}
{:names=>["tim", "fred"]}
{:user=>{:name=>"Erin", :email=>"erin@erin.com", :paid=>true}}

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
