feature "user sees pictures of art on homepage" do
  scenario "when user is not logged in" do

    visit root_path
    click_on "Sign Up"

    within "article.sign-up-form" do
      fill_in "Email", :with => "jessica@gmail.com"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password"
      click_on "Register"
    end

    upload_picture

    click_on "Sign Out"

    visit root_url

    # within('.card') do
    #   image = page.find('img')
    #
    #   expect(image).to_not be_nil
    # end
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