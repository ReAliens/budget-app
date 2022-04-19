class User < ApplicationRecord
  has_many :payments, foreign_key: 'author_id', dependent: :destroy
  has_many :Categories, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 5, maximum: 20 }
end
