require 'rails_helper'

feature 'Visitor signs in' do
  scenario 'successfully' do
    create_user

    sign_in_with(email: "jessica@gmail.com", password: "12345")

    expect(page).to have_content("Sign Out")
    expect(page).not_to have_content("Sign In")
  end

  scenario 'with incorrect password' do
    create_user

    sign_in_with(email: "jessica@gmail.com", password: "OMG I'M A HACKER")

    expect(page).to have_content("Incorrect email or password")
    expect(page).to have_content("Sign In")
    expect(page).not_to have_content("Sign Out")
  end

  scenario 'with invalid username' do
    create_user

    sign_in_with(email: "hello@hacker.com", password: "12345")

    expect(page).to have_content("Incorrect email or password")
    expect(page).to have_content("Sign In")
    expect(page).not_to have_content("Sign Out")
  end

  scenario 'can sign out' do
    create_user
    sign_in_with(email: "jessica@gmail.com", password: "12345")

    click_on "Sign Out"

    expect(page).to have_content("Sign In")
    expect(page).not_to have_content("Sign Out")
  end

  def create_user
    User.create!(
      :email => "jessica@gmail.com",
      :password => "12345"
    )
  end

  def sign_in_with(email:, password:)
    visit root_path
    click_on "Sign In"

    within ".sign-in-form" do
      fill_in "Email", :with => email
      fill_in "Password", :with => password
      click_on "Sign In"
    end
  end
end