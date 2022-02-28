# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :name, presence: true,length: { maximum: 999 }
  validates :email, presence: true,length: { maximum: 256 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
