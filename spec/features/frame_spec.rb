require "rails_helper"

feature "User can upload a frame to sell" do
  scenario "successfully" do

    register(email: "jessica@gmail.com", password: "12345")

    click_on "Sell Frames"
    create_frame
    expect(page).to have_content "gilted frame"

    click_on "remove"
    expect(page).not_to have_content "gilted frame"
  end
end
