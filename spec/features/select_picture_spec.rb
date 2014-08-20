feature "select picture to visualize in frame" do
  scenario "successfully" do

    upload_picture

    click_on "select"

    within ".work-table" do
      image = page.find('img')
      expect(image).to_not be_nil
    end
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