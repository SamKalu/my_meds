class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, uniqueness: { scope: :user_id }

end
