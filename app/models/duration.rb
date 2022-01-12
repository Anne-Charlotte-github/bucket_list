class Duration < ApplicationRecord
  attr_readonly :nb_minutes
  has_many :dreams
  UNIT_CHOICES = %w(minute(s) hour(s) day(s) week(s) month(s) year(s)).freeze
  validates :unit, presence: true, inclusion: { in: UNIT_CHOICES }
  before_validation :unit_nb_to_minutes, if: -> { attributes_defined([quantity]) }

  private

  def unit_nb_to_minutes
    quotient_to_min = {
      'minute(s)' => 1,
      'hour(s)' => 60,
      'day(s)' => 1_440, # 60 * 24
      'week(s)' => 10_080, # 60 * 24 * 7
      'month(s)' => 302_400, # 60 * 24 * 7 * 30
      'year(s)' => 3_628_800 # 60 * 24 * 7 * 30 * 12
    }
    self.nb_minutes = quantity * quotient_to_min[unit]
  end
end
