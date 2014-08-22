require "rails_helper"

feature "User can upload a frame to sell" do
  scenario "successfully" do
    visit root_url
    click_on "Sell Frames"

    attach_file('picture_image', 'spec/photos/frame.png')

    fill_in "Name", :with => "gilted frame"
    # check("checkbox")
    click_on "Create Frame"


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
