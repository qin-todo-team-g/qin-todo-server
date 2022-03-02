FactoryBot.define do
  factory :task do
    association :user
    task_type { 1 }
    is_done { false }
    title { "MyString" }
  end
end
