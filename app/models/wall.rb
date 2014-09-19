class Wall < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :height, :width, :description
  validates_numericality_of :height, :width
end