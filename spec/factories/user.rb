FactoryBot.define do
  factory :user do
    name { 'user' }
    sequence(:email) { |n| "test#{n}@email.com" }
    password { 'password' }
  end
end