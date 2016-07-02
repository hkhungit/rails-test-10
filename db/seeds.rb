puts "====Delete Data==========="
Comment.destroy_all
User.destroy_all

puts "====Start Insert User====="
jim   = User.create({email: 'jim@futureworkz.com', password: '123123'})
john  = User.create({email: 'john@futureworkz.com', password: '123123'})
puts "====End Insert User======"

puts "====Start Insert Comment=="
cm = Comment.create({ content: 'first comment', user_id: john.id, parent_id: 0})

comments = [
  { content: 'just a suggest', user_id: jim.id, parent_id: cm.id},
  { content: 'just a suggest 1', user_id: jim.id, parent_id: cm.id},
  { content: 'just a suggest 2', user_id: jim.id, parent_id: cm.id}
]

comments.each do |comment|
  Comment.create(comment)
end
puts "====End Insert Comment=="