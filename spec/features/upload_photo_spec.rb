require "rails_helper"

feature "User can upload a photo" do
  scenario "succesfully" do
    visit root_url

    click_on "Upload a picture to frame"


    attach_file('picture_image', 'spec/photos/frame.png')
    click_button "Upload a picture to frame"

    within('.container') do
      image = page.find('img')
      expect(image).to_not be_nil
      # expect(image['src']).to eq 'frame.png'
    end
  end
end