class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_dreams, foreign_key: :owner_id, class_name: 'Dream'

  has_many :memberships
  has_many :dreams, through: :memberships # where memberships.status = accepted..

  has_many :friendships
  has_many :friends, -> { Friendship.confirmed }, through: :friendships

  validates :nickname, presence: true, uniqueness: { case_sensitive: false, message: 'already exists' }
end
