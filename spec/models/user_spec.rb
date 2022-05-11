require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Barbare', email: 'ahmedreda152@gmail.com')
  before { user.save }

  it 'should have many categories' do
    category = User.reflect_on_association(:categories)
    expect(category.macro).to eq(:has_many)
  end

  it 'should have many payments' do
    payment = User.reflect_on_association(:payments)
    expect(payment.macro).to eq(:has_many)
  end

  it 'return invalid user' do
    user.name = ''
    expect(user).to_not be_valid
  end

  it 'return invalid user name' do
    user.name = 'ahm'
    expect(user).to_not be_valid
  end
end
