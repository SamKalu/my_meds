class Med < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :intakes, through: :schedules
  has_one_attached :photo

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :stock, presence: true
end
