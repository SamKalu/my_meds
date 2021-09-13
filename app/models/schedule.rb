class Schedule < ApplicationRecord
  attr_accessor :time

  enum status: %i[inactive active]
  has_many :intakes
  belongs_to :med
  belongs_to :treatment
  before_validation :clean_arrays

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
