# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  name: "user_1",
  email: "test_1@gmail.com",
  sub: "cCmq98NQUdw4TNdV0bSVXOrGFqSnNfxD@clients",
)
5.times do |m|
  Task.create(
    user_id: User.find(1).id,
    task_type: rand(3),
    title: "task#{m + 1}",
  )
end
