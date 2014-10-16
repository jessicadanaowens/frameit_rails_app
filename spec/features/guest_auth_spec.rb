require 'rails_helper'

feature 'visitor registers' do
  scenario 'successfully' do

    register(email: "bill@gmail.com", password: "12345")

    expect(page).not_to have_content("Sign In")

    within "header" do
      expect(page).not_to have_content("Sign Up")
    end
  end

  scenario 'unsuccessfully' do
    register(email: "", password: "12345")
    expect(page).to have_content("Email can't be blank")

    register(email: "blake@gmail.com", password: "")
    expect(page).to have_content("Password can't be blank")

    register(email: "ellen@gmail.com", password: "12345")
    click_on "Sign Out"
    click_on "Sign Up"
    register(email: "ellen@gmail.com", password: "12345")
    expect(page).to have_content("Email has already been taken")
  end
end

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
end