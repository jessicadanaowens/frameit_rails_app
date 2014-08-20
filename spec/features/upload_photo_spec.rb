require "rails_helper"

feature "User can upload a photo" do
  scenario "succesfully" do
    upload_picture

    within('.cards') do
      image = page.find('img')

      expect(image).to_not be_nil
    end
  end

  scenario "User can edit a photo" do
    upload_picture

    click_on "edit"

    fill_in "picture_file_name", :with => "a different description"
    click_button "Update Picture"

    expect(page).to have_content "a different description"
  end

  def upload_picture
    visit root_url

    click_on "Upload a picture to frame"

    fill_in "picture_file_name", :with => "description"
    attach_file('picture_image', 'spec/photos/frame.png')
    click_button "Upload"

    expect(page).to have_content "description"
  end
end
