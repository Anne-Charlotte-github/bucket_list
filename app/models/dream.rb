class Dream < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: 'User'
  belongs_to :duration, optional: true
  belongs_to :location, optional: true
  belongs_to :schedule, optional: true

  has_many :dreams_categories

  has_many :memberships
  has_many :users, through: :memberships
end
