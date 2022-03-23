# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           default(""), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'name' do
      example '表示名が正しい' do
        expect(User.human_attribute_name(:name)).to eq('ユーザー名')
      end
      example '空は無効' do
        user = FactoryBot.build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end
      example '1000文字は無効' do
        user = FactoryBot.build(:user, name: 'a' * 1000)
        user.valid?
        expect(user.errors[:name]).to include('は999文字以内で入力してください')
      end
      example '999文字は有効' do
        user = FactoryBot.build(:user, name: 'a' * 999)
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'email' do
      example '表示名が正しい' do
        expect(User.human_attribute_name(:email)).to eq('メールアドレス')
      end
      example '256文字は有効' do
        user = FactoryBot.build(:user, email: 'a' * 244 + '@example.com')
        user.valid?
        expect(user).to be_valid
      end
      example '257文字は無効' do
        user = FactoryBot.build(:user, email: 'a' * 245 + '@example.com')
        user.valid?
        expect(user.errors[:email]).to include('は256文字以内で入力してください')
      end
      example 'email形式でないものは無効' do
        user = FactoryBot.build(:user, email: 'a' * 256)
        user.valid?
        expect(user.errors[:email]).to include('は不正な値です')
      end
    end
  end
end
