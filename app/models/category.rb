class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_and_belongs_to_many :payments

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :icon, presence: true
end
