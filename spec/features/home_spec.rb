# feature "user sees pictures of art on homepage" do
#   scenario "when user is logged in and not logged in" do
#
#     upload_picture
#
#     visit root_url
#
#     within('.cards') do
#       image = page.find('img')
#
#       expect(image).to_not be_nil
#     end
#   end
#
#   def upload_picture
#     visit root_url
#
#     click_on "Upload a picture to frame"
#
#     within('#upload-picture-form') do
#       fill_in "picture_file_name", :with => "description"
#       fill_in "Height", :with => "5"
#       fill_in "Width", :with => "6"
#       attach_file('picture_image', 'spec/photos/frame.png')
#       click_button "Upload"
#     end
#     expect(page).to have_content "description"
#   end
# end