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
  validates :name, presence: true, length: { maximum: 999 }
  validates :email, presence: true, length: { maximum: 256 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def self.from_token_payload(payload)
    find_by(sub: payload['sub']) || create!(name: payload["#{ENV['CLIENT_URL']}/claims/name"], email: payload["#{ENV['CLIENT_URL']}/claims/email"], sub: payload['sub'])
  end
end
