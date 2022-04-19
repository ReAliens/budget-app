class Payment < ApplicationRecord
  has_many :Category, foreign_key: 'payment_id', dependent: :destroy
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :amount, presence: true, comparison: { greater_than: 0 }
end
