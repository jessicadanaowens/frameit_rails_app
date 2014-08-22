require "rails_helper"

feature "User can upload a frame to sell" do
  scenario "successfully" do

    register(email: "jessica@gmail.com", password: "12345")

    Frame_Size.create(:height => 10, :width => 10, :dimensions=>'10" x 10"')

    click_on "Sell Frames"


    attach_file('frame_image', 'spec/photos/frame.png')

    fill_in "Name", :with => "gilted frame"

    check('10" x 10"')
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
