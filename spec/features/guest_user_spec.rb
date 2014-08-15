require "rails_helper"

feature "user can enter site as a guest" do
  scenario "successfully" do
    visit root_url

    click_button("Upload a picture to frame")
    expect(page).to have_content("Signed in as guest")
    expect(page).to have_content("Sign In")

  end
end