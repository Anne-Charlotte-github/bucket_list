class Schedule < ApplicationRecord
  has_many :dreams

  validate :end_at_after_start_at, if: -> { attributes_defined([end_at, start_at]) }

  private

  def end_at_after_start_at
    errors.add(:end_at, 'cannot be before start_at') if end_at < start_at
  end
end
