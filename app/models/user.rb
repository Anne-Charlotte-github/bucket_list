class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memberships
  has_many :dreams, through: :memberships
  has_many :owned_dreams, foreign_key: :owner_id, class_name: 'Dream'
  has_many :friendships
  has_many :friends, -> { where is_confirmed: true }, through: :friendships, class_name: 'User'
end
