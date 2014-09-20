require "rails_helper"

feature "user can upload a picture of a wall" do
  scenario "successfully" do
    visit root_url

    click_on "Upload a picture to frame"
    create_wall
  end
end