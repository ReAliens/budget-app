require 'rails_helper'

RSpec.describe Payment, type: :model do
  user = User.create(name: 'Barbare')
  payment = Payment.new(user: user, name: 'jumping rope', amount: 23)

  before { payment.save }

  it 'subject should be valid' do
    expect(payment).to be_valid
  end

  it 'should have and belongs to many categories' do
    category = Payment.reflect_on_association(:categories)
    expect(category.macro).to eq(:has_and_belongs_to_many)
  end

  it 'should belongs to user' do
    user = Payment.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'isn\'t valid without name' do
    payment.name = ''
    expect(payment).to_not be_valid
  end

  it 'isn\'t valid with name less than 3 characters' do
    payment.name = 'ha'
    expect(payment).to_not be_valid
  end

  it 'isn\'t valid with no amount equal to zero' do
    payment.amount = 0
    expect(payment).to_not be_valid
  end
end
