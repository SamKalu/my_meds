class Schedule < ApplicationRecord
  enum status: %i[inactive active]
  belongs_to :med
  belongs_to :treatment
end
