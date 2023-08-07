class Detail < ApplicationRecord
  belongs_to :user
  has_many :category_details
  has_many :categories, through: :category_details

  validates :name, presence: true, length: { in: 1..50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
