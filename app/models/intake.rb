class Intake < ApplicationRecord
  belongs_to :schedule
  validates :schedule, uniqueness: { scope: :due_date }
  delegate :user, to: :schedule

  def should_be_taken?
    taken == false && due_date.strftime("%H%M") <= Time.now.strftime("%H%M")
  end
end
