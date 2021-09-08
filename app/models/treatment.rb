class Treatment < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  validates :name, presence: true
end
