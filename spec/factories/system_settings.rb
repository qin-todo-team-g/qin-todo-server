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
FactoryBot.define do
  factory :system_setting do
    user
    is_dark { false }
  end
end
