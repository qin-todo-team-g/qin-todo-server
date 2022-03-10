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
require 'rails_helper'

RSpec.describe SystemSetting, type: :model do
  describe 'validation' do
    context 'is_dark' do
      example '表示名が正しい' do
        expect(SystemSetting.human_attribute_name(:is_dark)).to eq('ダークモード')
      end
      example '空は無効' do
        system_setting = FactoryBot.build(:system_setting, is_dark: nil)
        system_setting.valid?
        expect(system_setting.errors[:is_dark]).to include('は一覧にありません')
      end
    end
  end

  describe 'association' do
    context 'Userモデルとの関係' do
      example '1:1となっている' do
        expect(SystemSetting.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
