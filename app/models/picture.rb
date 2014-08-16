class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :image, :presence => { :message => "Please select a file to upload" }
end

