require 'rails_helper'

RSpec.describe 'Categories index page', type: :feature do
  before :each do
    @user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    visit '/'
    click_link 'Log In'
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    visit '/payments'
  end

  it 'should have the following content' do
    expect(page).to have_content('Payments')
    expect(page).to have_content('Total payments')
    expect(page).to have_content('No payments added yet')
  end

  it 'should redirect to the right path' do
    click_link 'Add Payment'
    expect(current_path).to eq(new_payment_path)
  end

  it 'should display the created transaction' do
    @category = @user.categories.create!(name: 'Foods', icon: 'cate.png')
    @payment = @user.payments.create!(name: 'Rice Payment', amount: 100, category: @category)
    visit '/payments'
    expect(page).to have_content('Payments')
    expect(page).to have_content('Total payments')
    expect(page).to have_content(@payment.created_at)
    expect(page).to have_content('$ 100')
    expect(page).to have_link('Add Payment')
  end
end
