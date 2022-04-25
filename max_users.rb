#!/usr/bin/env ruby

# Write a function which returns the maximum number of concurrent users logged in at the same time.

data = [
  {userId: "userId1", loginTime: 2, logoutTime: 5},
  {userId: "userId2", loginTime: 3, logoutTime: 7},
  {userId: "userId3", loginTime: 3, logoutTime: 5}, # added
  {userId: "userId4", loginTime: 1, logoutTime: 10},
  {userId: "userId5", loginTime: 15, logoutTime: 15},
  {userId: "userId6", loginTime: 14, logoutTime: 16}
]
# loginTime: 1, logoutTime: 10   1
# loginTime: 2, logoutTime: 5    2
# loginTime: 3, logoutTime: 5    3
# loginTime: 3, logoutTime: 7    4 <==
# loginTime: 14, logoutTime: 16  1
# loginTime: 15, logoutTime: 15  2

def maximum_number_users(users)
  tree = [] # should be tree
  max = 0
  users.each do |node|
    cur_time = node[:loginTime]
    out_time = node[:logoutTime]

    tree << out_time # should be method
    tree.reject! { |x| x < cur_time } # should be method
    max = tree.size if tree.size > max
  end
  max
end

users = data.sort_by { |h| [h[:loginTime], h[:logoutTime]] }
puts maximum_number_users(users)
