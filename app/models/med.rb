class Med < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :stock, presence: true
end
