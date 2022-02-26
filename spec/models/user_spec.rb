require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'user' do
      example '空は無効' do
        user = FactoryBot.build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end
    end
  end
end
