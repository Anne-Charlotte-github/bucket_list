class Category < ApplicationRecord
  has_many :dreams_categories
  has_many :dreams, through: :dreams_categories
end
