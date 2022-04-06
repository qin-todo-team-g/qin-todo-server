# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           default(""), not null
#  name       :string           default(""), not null
#  sub        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # TODO: 暫定的にallow_blank: trueを追加。auth0のカスタムフィールドにnameを追加の上削除する。
  validates :name, presence: true, length: { maximum: 999 }, allow_blank: true
  # TODO: 暫定的にallow_blank: trueを追加。認証時のレスポンスにemailを含めるようauth0のRulesを変更の上削除する。
  validates :email, presence: true, length: { maximum: 256 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true

  def self.from_token_payload(payload)
    # TODO: サインアップ時にauth0のレスポンスからnameとemailを取得して同時に登録したい
    find_by(sub: payload['sub']) || create!(sub: payload['sub'])
  end
end
