# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  User.create(
    name: "user#{n+1}",
    email: "test#{n+1}@gmail.com",
  )
  5.times do |m|
    Task.create(
      user_id: User.find(n+1).id,
      task_type: rand(3),
      title: "task#{m+1}",
    )
  end
end
