# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  enum task_type: { today: 0, tomorrow: 1, next_time: 2 }
  validates :task_type, presence: true
  validates :is_done, inclusion: [true, false]
  validates :title, presence: true
end
