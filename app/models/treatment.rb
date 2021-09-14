class Treatment < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :meds, through: :schedules

  validates :name, presence: true, uniqueness: { scope: :user_id}
end
