# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
User.destroy_all

jim   = User.create({email: 'jim@futureworkz.com', password: '123123'})
john  = User.create({email: 'john@futureworkz.com', password: '123123'})


cm = Comment.create({ content: 'first comment', user_id: john.id, parent_id: 0})

comments = [
  { content: 'just a suggest', user_id: jim.id, parent_id: cm.id},
  { content: 'just a suggest 1', user_id: jim.id, parent_id: cm.id},
  { content: 'just a suggest 2', user_id: jim.id, parent_id: cm.id}
]

comments.each do |comment|
  Comment.create(comment)
end