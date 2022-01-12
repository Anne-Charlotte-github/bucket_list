class Category < ApplicationRecord
  has_many :dreams_categories
  has_many :dreams, through: :dreams_categories
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: 'was already created' }
end
