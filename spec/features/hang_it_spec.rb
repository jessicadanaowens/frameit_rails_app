require "rails_helper"

feature "User can hang a photo" do
  scenario "successfully" do
    upload_picture

    click_on "hang it"

    within('#room') do
      image = page.find('img#hang-picture')
      expect(image).to_not be_nil
    end
  end

  def upload_picture
    visit root_url

    click_on "Upload a picture to frame"

    within('#upload-picture-form') do
      fill_in "picture_description", :with => "description"
      fill_in "Height", :with => "5"
      fill_in "Width", :with => "6"
      attach_file('picture_image', 'spec/photos/frame.png')
      click_button "Upload"
    end

    expect(page).to have_content "description"
  end
end