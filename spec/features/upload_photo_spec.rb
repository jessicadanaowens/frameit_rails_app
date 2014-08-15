require "rails_helper"

feature "User can upload a photo" do
  scenario "succesfully" do
    visit root_url

    click_on "Upload a picture to frame"

    attach_file('picture_avatar', 'spec/photos/frame.png')
    click_button "Upload a picture to frame"

    within('.unframed_pictures_gallery') do
      image = page.find('img')
     
      expect(image).to_not be_nil

    end
  end
end

