class DreamsCategory < ApplicationRecord
  belongs_to :category
  belongs_to :dream
end
