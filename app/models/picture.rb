class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :image, :presence => { :message => "Please select a file to upload" }
  validates :height, :presence => true, numericality: true
  validates :width, :presence => true, numericality: true
end

