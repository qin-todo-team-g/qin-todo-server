# == Schema Information
#
# Table name: system_settings
#
#  id         :bigint           not null, primary key
#  is_dark    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_system_settings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class SystemSetting < ApplicationRecord
  belongs_to :user
  validates :is_dark, inclusion: [true, false]
end
