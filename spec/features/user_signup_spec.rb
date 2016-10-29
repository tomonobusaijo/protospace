require 'rails_helper'

feature "User management" do
  scenario "adds a new user", js: true do
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    find('#user_name').set('New User')
    attach_file 'user[avatar]', File.join(Rails.root, '/spec/fixtures/img/sample.jpg'), visible: false
    find('#user_email').set('newuser@example.com')
    find('#user_password').set('secret123')
    find('#user_password_confirmation').set('secret123')
    find('#user_member').set('Expert 3rd')
    find('#user_profile').set('I am a member of Expert 3rd, TECH::CAMP')
    find('#user_works').set('freelance engineer')
    click_on 'Save'
    expect(page).to have_selector '.alert', text: 'Welcome! You have signed up successfully.'
  end
end
