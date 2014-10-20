require "rails_helper"

feature "user can upload a picture of a wall" do
  scenario "successfully" do
    visit root_url

    click_on "Visualize your art in different spaces.  Frame-it, stage-it & share-it."
    create_wall
  end
end