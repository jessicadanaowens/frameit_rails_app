feature "user can upload a picture of a wall" do
  scenario "successfully" do
    upload_picture
  end

  def upload_picture
    visit root_url
    click_on "Upload a picture to frame"
    within('#upload-wall-form') do
      fill_in "Description", :with => "description"
      fill_in "Height", :with => "5"
      fill_in "Width", :with => "6"
      attach_file('wall_image', 'spec/photos/frame.png')
      click_button "Create Wall"
    end
  end
end