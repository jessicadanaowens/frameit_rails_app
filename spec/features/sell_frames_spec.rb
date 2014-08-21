require "rails_helper"

feature "User clicks on the sell frames link in the navbar" do
  scenario "and fills out a form to sell a frame" do

    click_on "Sell Frames"

    fill_in "item number", :with => "123"
    fill_in "custom?", :with => "false"
    # fill_in "name", :with =>"gilted frame"
    # find(:css, "#frameID[value='62']").set(true)
    # attach_file('picture_image', 'spec/photos/frame.png')
    # click_button "Upload"
    #
    # expect(page).to have_content "description"


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
