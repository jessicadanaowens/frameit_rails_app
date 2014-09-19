require "rails_helper"

feature "User can upload a frame to sell" do
  scenario "successfully" do

    register(email: "jessica@gmail.com", password: "12345")

    click_on "Sell Frames"

    attach_file('frame_image', 'spec/photos/frame.png')

    fill_in "Name", :with => "gilted frame"
    fill_in "inner frame height (inches)", :with => 36
    fill_in "inner frame width (inches)", :with => 36
    fill_in "width of moulding (inches)", :with => 2

    click_on "Create Frame"
    expect(page).to have_content "gilted frame"
    click_on "remove"
    expect(page).not_to have_content "gilted frame"
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
