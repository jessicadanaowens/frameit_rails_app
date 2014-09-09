require "rails_helper"

feature "User can upload a photo" do
  scenario "succesfully" do
    upload_picture

    within('.accordion-tabs') do
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

  scenario "User can share a photo" do
    upload_picture

    click_on "share"
    # expect(page).to have_content("don't share it")
    #
    # click_on "don't share"
    # expect(page).have_content("share")
  end

  scenario "User can hang a photo" do
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
      fill_in "picture_file_name", :with => "description"
      fill_in "Height", :with => "5"
      fill_in "Width", :with => "6"
      attach_file('picture_image', 'spec/photos/frame.png')
      click_button "Upload"
    end
    expect(page).to have_content "description"
  end

end
