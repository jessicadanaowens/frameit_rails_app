require "rails_helper"

feature "User can upload a photo" do
  scenario "succesfully", :js => true do
    upload_picture

    within('.accordion-tabs') do
      image = page.find('img')

      expect(image).to_not be_nil
    end
  end

  scenario "User can edit the description of a photo", :js => true do
    upload_picture

    expect(find('em.picture-description').text).to eq("description")

    within(".cards") do
      find('em.picture-description').click
      fill_in "description", :with => "a different description"
      click_button "save"
    end

    expect(page).to have_content "a different description"
  end

  scenario "User can share and unshare a photo", :js => true do
    upload_picture

    click_on "share it"
    expect(page).to have_content("don't share")

    click_on "don't share"
    expect(page).to have_content("share it")
  end

  scenario "User can hang a photo", :js => true do
    upload_picture

    click_on "hang it"
  end

  scenario "User can delete a photo", :js => true do
    upload_picture

    within(".cards") do
    find('span.delete-picture').click
    expect(page).to_not have_content "description"
    end

  end
end
