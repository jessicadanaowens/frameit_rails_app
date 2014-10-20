require "rails_helper"

feature "user can enter site as a guest" do
  scenario "successfully" do
    visit root_url

    click_button("Visualize your art in different spaces.  Frame-it, stage-it & share-it.")
    expect(page).to have_content("Signed in as guest")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
  end

  scenario "guest can register, create a picture, and have data persisted" do
    visit root_url

    click_button("Visualize your art in different spaces.  Frame-it, stage-it & share-it.")
    create_picture
    expect(page).to have_content "description"
    register(email: "chris@gmail.com", password: "12345")
    click_on "Your Gallery"
    expect(page).to have_content "description"
  end

  scenario "guest can create a wall" do
    visit root_url

    click_button("Visualize your art in different spaces.  Frame-it, stage-it & share-it.")
    create_wall
    expect(page).to have_content "description"
  end
end