class AddPaymentsRefToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :payment, null: false, foreign_key: true
  end
end
