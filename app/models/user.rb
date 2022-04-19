class User < ApplicationRecord
  has_many :payments, foreign_key: 'author_id', dependent: :destroy
  has_many :Categories, foreign_key: 'author_id', dependent: :destroy
end
