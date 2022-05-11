require 'rails_helper'

RSpec.describe 'Categories show page', type: :feature do
  before :each do
    @user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password')
    visit '/'
    click_link 'Log In'
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    @category = @user.categories.create!(name: 'Foods', icon: 'cate.png')
    @payment = @user.payments.create!(name: 'Rice Payment', amount: 100, category: @category)
    visit payments_path(@payment)
  end

  it 'should have the following content' do
    expect(page).to have_content('Rice Payment')
    expect(page).to have_content('$ 100')
    expect(page).to have_content('Total Payment')
  end
end
