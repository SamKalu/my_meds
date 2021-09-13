class Schedule < ApplicationRecord
  attr_accessor :time

  enum status: %i[inactive active]
  belongs_to :med
  belongs_to :treatment
  before_validation :clean_arrays
  validates :med, presence: true, uniqueness: { scope: :treatment_id }

  def clean_arrays
    self.times = times.reject(&:empty?)
  end

  WEEKDAYS = [['MO', 'monday'],
              ['TU', 'tuesday'],
              ['WE', 'wednesday'],
              ['TH', 'thursday'],
              ['FR', 'friday'],
              ['SA', 'saturday'],
              ['SU', 'sunday']]
end
