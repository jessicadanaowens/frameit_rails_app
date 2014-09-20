require "rails_helper"

feature "user sees pictures of art on homepage" do
  scenario "when user is not logged in", :js =>true do
    visit root_path

    click_on "Sign Up"
    register(email: "jess@gmail.com", password: "12345")

    upload_picture
    click_on "Sign Out"

    # within('div.three-columns') do
    #   image = page.find('img')
    #   expect(image).to_not be_nil
    # end
  end
end