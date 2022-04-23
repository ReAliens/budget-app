require 'rails_helper'

RSpec.describe 'home', type: :system do
  it 'should return right content' do
    visit '/'
    expect(page).to have_content('Budget It')
    expect(page).to have_content('Log In')
    expect(page).to have_content('Sign Up')
  end

  it 'should redirect to right pages after clicking link' do
    visit '/'
    click_link 'Log In'
    expect(page).to have_current_path('/users/sign_in')
  end

  it 'should redirect to right pages after clicking link' do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_current_path('/users/sign_up')
  end
end
