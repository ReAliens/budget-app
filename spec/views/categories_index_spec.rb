require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before :each do
    @user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password')
    visit '/'
    click_link 'Log In'
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    visit '/'
  end

  it 'should return right contents' do
    expect(page).to have_content('Categories')
    expect(page).to have_content('No Categories Added')
    expect(page).to have_content('Add Category')
  end

  it 'should redirect to new catgories path' do
    click_link 'Add Category'
    expect(page).to have_current_path('/categories/new')
  end

  it 'should create new category' do
    @user.categories.create!(name: 'K.F.C', icon: 'cate.png')
    visit '/categories'
    expect(page).to have_content('K.F.C')
    expect(page).to have_content('$ 0')
    expect(page).to have_link('Add Category')
  end
end
