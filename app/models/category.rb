class Category < ApplicationRecord
  belongs_to :user
  has_many :category_details
  has_many :details, through: :category_details

  validates :name, presence: true, length: { in: 1..50 }
  validates :icon, presence: true, length: { in: 1..350 }
end
