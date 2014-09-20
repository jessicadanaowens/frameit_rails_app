require "rails_helper"

feature "select picture to visualize in frame" do
  scenario "successfully" do

    upload_picture

    click_on "frame it"

    within ".work-table" do
      page.find('img.picture')['src'].should have_content 'frame.png'
    end
  end
end