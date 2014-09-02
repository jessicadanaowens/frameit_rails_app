require "rails_helper"

feature "User can hang a photo" do
  scenario "successfully" do
    upload_picture

    click_on "hang it"

    within('#room') do
      image = page.find('img#hang-picture')
      expect(image).to_not be_nil
    end

    fill_in "wall_description", :with => "beautiful room"
    fill_in "height", :with => "60"
    fill_in "width", :with => "72"
    attach_file('wall_image', 'spec/photos/frame.png')
    click_on "Create wall"
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