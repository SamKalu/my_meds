class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meds, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :schedules, through: :meds

  validates :first_name, presence: true
  validates :last_name, presence: true
end
