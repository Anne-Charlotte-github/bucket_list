class Image < ApplicationRecord
  belongs_to :dream
  belongs_to :owner, through: :dream
end
