class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :payments, foreign_key: 'category_id', dependent: :destroy
end
