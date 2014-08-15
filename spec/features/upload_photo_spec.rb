require "rails_helper"

feature "User can upload a photo" do
  scenario "succesfully" do

    upload_picture

    within('.unframed_pictures_gallery') do
      image = page.find('img')

      expect(image).to_not be_nil
    end

  end

  def upload_picture
    visit root_url

    click_on "Upload a picture to frame"

    fill_in "picture_file_name", :with => "description"
    attach_file('picture_avatar', 'spec/photos/frame.png')
    click_button "Upload a picture to frame"

    expect(page).to have_content "description"
  end

  def edit

  end

end

