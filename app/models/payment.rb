class Payment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  belongs_to :category

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :amount, presence: true, comparison: { greater_than: 0 }

  def self.total_amounts(payments)
    sum = 0
    payments.all.each do |payment|
      sum += payment.amount
    end
    sum
  end
end
