require "rails_helper"

feature "User can hang a photo" do
  scenario "successfully" do
    upload_picture
    create_wall

    click_on "hang it"

    within('#room') do
      picture = page.find('img#hang-picture')
      expect(picture).to_not be_nil
    end

    within('div#gallery-of-walls') do
      page.find('img')
    end
  end
end