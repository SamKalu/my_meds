class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meds, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :schedules, through: :meds
  has_many :documents, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one :carer, class_name: "User", foreign_key: "carer_id", dependent: :nullify

  has_one_attached :avatar

  def avatar_url
    if avatar.attached?
      avatar.service_url
    else
      "default_avatar_new.jpg"
    end
  end
end
