require "rails_helper"

feature "user can enter site as a guest" do
  scenario "successfully" do
    visit root_url

    click_button("Upload a picture to frame")
    expect(page).to have_content("Signed in as guest")
    expect(page).to have_content("Sign In")

  end

  scenario "guest can register and have data persisted" do
    visit root_url
    click_button("Upload a picture to frame")

    within('#upload-picture-form') do
      fill_in "picture_file_name", :with => "description"
      fill_in "Height", :with => "5"
      fill_in "Width", :with => "6"
      attach_file('picture_image', 'spec/photos/frame.png')
      click_button "Upload"
    end

    expect(page).to have_content "description"

    click_on "Sign Up"

    within "article.sign-up-form" do
      fill_in "Email", :with => "email"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password"
      click_on "Register"
    end
    expect(page).to have_content "description"
  end
end