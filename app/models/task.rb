class Task < ApplicationRecord
  belongs_to :user
  enum task_type: [ :today, :tomorrow, :next_time ]
  validates :task_type, presence: true
  validates :is_done, inclusion: [true, false]
  validates :title, presence: true
end
