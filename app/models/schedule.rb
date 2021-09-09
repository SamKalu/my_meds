class Schedule < ApplicationRecord
  enum status: %i[inactive active]
  belongs_to :med
  belongs_to :treatment

  WEEKDAYS = [['MO', 'monday'],
              ['TU', 'tuesday'],
              ['WE', 'wednesday'],
              ['TH', 'thursday'],
              ['FR', 'friday'],
              ['SA', 'saturday'],
              ['SU', 'sunday']]
end
