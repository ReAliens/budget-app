class Payment < ApplicationRecord
  has_many :Category, foreign_key: 'payment_id', dependent: :destroy
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
end
