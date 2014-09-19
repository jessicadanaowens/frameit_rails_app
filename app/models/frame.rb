class Frame < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  validates_presence_of :inner_height, :inner_width, :width_of_moulding, :name, :image
  validates_numericality_of :inner_height, :inner_width, :width_of_moulding
end