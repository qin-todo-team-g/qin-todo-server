# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  is_done    :boolean          default(FALSE), not null
#  task_type  :integer          not null
#  title      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :user
  enum task_type: { today: 0, tomorrow: 1, next_time: 2 }
  validates :task_type, presence: true
  validates :is_done, inclusion: [true, false]
  validates :title, presence: true, length: { maximum: 999 }
end
