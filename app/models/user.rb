class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meds, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :schedules, through: :meds
end
