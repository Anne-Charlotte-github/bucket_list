class Membership < ApplicationRecord
  belongs_to :users
  belongs_to :dream
  belongs_to :owner, through: :dream
end
