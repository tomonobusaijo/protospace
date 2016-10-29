require 'rails_helper'

feature "Prototype management" do
  background do
    @user = create(:user)
  end

  scenario "post prototype" do
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Sign in'
    expect(page).to have_selector '.alert', text: 'Signed in successfully.'

    click_on 'New Proto'
    fill_in 'Title', with: 'hogehoge'
    files = [*0..rand(3)].map{ |i| i.to_s}
    files.each do |i|
      attach_file 'prototype_capturedimages_attributes_' + i + '_picture', File.join(Rails.root, '/spec/fixtures/img/sample' + i + '.jpg'), visible: false
    end
    fill_in 'Catch Copy', with: 'hogehoge'
    fill_in 'Concept', with: 'hogehoge'
    click_on 'Publish'
    expect(page).to have_selector '.alert', text: 'Prototype was successfully created.'
  end
end
