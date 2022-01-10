class Dream < ApplicationRecord
  belongs_to :owner
  belongs_to :duration
  belongs_to :location
  belongs_to :schedule
end
