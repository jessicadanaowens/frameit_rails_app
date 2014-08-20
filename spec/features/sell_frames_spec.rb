require "rails_helper"

feature "Signed in user clicks on the sell frames link in the navbar" do
  scenario "and can fill out a form to sell a frame" do

    register

    click_on "Sell Frames"

    fill_in "picture_file_name", :with => "description"
    attach_file('picture_image', 'spec/photos/frame.png')
    click_button "Upload"

    expect(page).to have_content "description"


  end

  def register (email:, password:)
    visit root_path
    click_on "Sign Up"

    within "article.sign-up-form" do
      fill_in "Email", :with => email
      fill_in "Password", :with => password
      fill_in "Password confirmation", :with => password
      click_on "Register"
    end
  end

end
