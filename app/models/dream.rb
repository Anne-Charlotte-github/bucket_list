class Dream < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: 'User'
  belongs_to :duration, optional: true
  belongs_to :location, optional: true
  belongs_to :schedule, optional: true
  has_many :dreams_categories
  has_many :memberships
  has_many :users, through: :memberships

  after_initialize :set_defaults

  validates :title, presence: true, uniqueness: { case_sensitive: false, message: 'already exists' }
  validate :nb_users_max_not_inferior_to_min, if: -> { attributes_defined([nb_users_max, nb_users_min]) }

  private

  def set_defaults
    self.is_hidden = true if new_record?
  end

  # def nbs_users_defined
  #   !nb_users_max.nil? && !nb_users_min.nil?
  # end

  def nb_users_max_not_inferior_to_min
    errors.add(:nb_users_max, 'cannot be < to nb_users_min') if nb_users_max < nb_users_min
  end
end
