require 'rails_helper'

feature 'visitor registers' do
  scenario 'successfully' do

    register(email: "blake@gmail.com", password: "12345")

    expect(page).not_to have_content("Sign In")

    within "header" do
      expect(page).not_to have_content("Sign Up")
    end

  end

    def register (email:, password:)
      visit sign_up_path
      click_on "Sign Up"

      within ".sign-up-form" do
        fill_in "Email", :with => email
        fill_in "Password", :with => password
        fill_in "Password confirmation", :with => password
        click_on "Register"
      end
    end
end