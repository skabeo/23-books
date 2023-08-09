class User < ApplicationRecord
  has_many :categories
  has_many :details
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :firstname, presence: true, length: { in: 1..15 }
  validates :surname, presence: true, length: { in: 1..15 }
end
