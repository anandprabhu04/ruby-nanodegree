friends = [
  {
    name: 'Diego',
    status: 'Online'
  },
  {
    name: 'Gloria',
    status: 'Away'
  },
  {
    name: 'Yu',
    status: 'Online'
  }
]

online_friends = []

friends.each do |friend|
  if friend[:status] == 'Online'
    online_friends.push friend
  end
end

# Using select keyword

online_friends_new = friends.select do |friend|
  friend[:status] == 'Online'
end

puts "Online Friends #{online_friends}"
puts "Online Friends New #{online_friends_new}"
