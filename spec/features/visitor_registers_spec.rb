require 'rails_helper'

feature 'visitor registers' do
  scenario 'successfully' do

    register(email: "blake@gmail.com", password: "12345")

    expect(page).not_to have_content("Sign In")

    within "header" do
      expect(page).not_to have_content("Sign Up")
    end

  end

  scenario 'click register from pictures page' do
    visit root_path
    click_button "Upload a picture to frame"
    click_on "Sign Up"

    within ".sign-up-form" do
      fill_in "Email", :with => "blake@gmail.com"
      fill_in "Password", :with => "12345"
      fill_in "Password confirmation", :with => "12345"
      click_on "Register"
    end

    expect(page.current_path).to eq pictures_path
  end

    def register (email:, password:)
      visit root_path
      click_on "Sign Up"

      within ".sign-up-form" do
        fill_in "Email", :with => email
        fill_in "Password", :with => password
        fill_in "Password confirmation", :with => password
        click_on "Register"
      end
    end


end