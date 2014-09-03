class Wall < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :image, :presence => true
  validates :height, :presence => true, numericality: true
  validates :width, :presence => true, numericality: true
end