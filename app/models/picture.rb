class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :image, :presence => { :message => "Please select a file to upload" }
end

