require 'rails_helper'

feature 'Visitor signs in' do
  scenario 'successfully' do
    User.create!(
      :email => "jessica@gmail.com",
      :password => "12345"
    )

    visit root_path
    click_on "Sign In"

    within ".sign-in-form" do
      fill_in "Email", :with => "jessica@gmail.com"
      fill_in "Password", :with => "12345"
      click_on "Sign In"
    end

    expect(page).to have_content("Sign Out")
    expect(page).not_to have_content("Sign In")
  end
end