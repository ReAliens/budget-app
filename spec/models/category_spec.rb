require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.create(name: 'Barbare')
  category = Category.new(user: user, name: 'macdonalds', icon: 'icon')

  before { category.save }

  it 'subject should be valid' do
    expect(category).to be_valid
  end

  it 'should have and belongs to many categories' do
    payment = Category.reflect_on_association(:payments)
    expect(payment.macro).to eq(:has_many)
  end

  it 'should belongs to user' do
    user = Category.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'isn\'t valid without name' do
    category.name = ''
    expect(category).to_not be_valid
  end

  it 'isn\'t valid with name less than 3 characters' do
    category.name = 'ha'
    expect(category).to_not be_valid
  end

  it 'isn\'t valid with no icons' do
    category.icon = ''
    expect(category).to_not be_valid
  end
end
