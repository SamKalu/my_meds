class Intake < ApplicationRecord
  belongs_to :schedule
  validates :schedule, uniqueness: { scope: :due_date }
end
