def create_user
  User.create!(
    :email => "jessica@gmail.com",
    :password => "12345"
  )
end

def create_picture
  within('#upload-picture-form') do
    fill_in "picture_description", :with => "description"
    fill_in "Height", :with => "5"
    fill_in "Width", :with => "6"
    attach_file('picture_image', 'spec/photos/frame.png')
    click_button "Upload"
  end
end

def create_wall
  click_on "Create a wall to hang your picture on"
  within('#upload-wall-form') do
    fill_in "wall[description]", :with => "description"
    fill_in "wall[height]", :with => "5"
    fill_in "wall_width", :with => "6"
    attach_file('wall_image', 'spec/photos/frame.png')
    click_button "Create Wall"
  end
end

def create_frame
  attach_file('frame_image', 'spec/photos/room.png')
  fill_in "Name", :with => "gilted frame"
  fill_in "frame[inner_height]", :with => 36
  fill_in "frame[inner_width]", :with => 36
  fill_in "frame[width_of_moulding]", :with => 2
  click_on "Create Frame"
end

def upload_picture
  visit "/"

  click_on "Visualize your art in different spaces.  Frame-it, stage-it & share-it."
  click_on "Select a picture to frame"
  within('#upload-picture-form') do
    fill_in "picture[description]", :with => "description"
    fill_in "Height", :with => "5"
    fill_in "Width", :with => "6"
    attach_file('picture_image', Rails.root + 'spec/photos/frame.png')
    click_button "Upload"
  end
end