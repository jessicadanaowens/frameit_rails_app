class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates_presence_of :image, :height, :width, :description
  validates_numericality_of :height, :width
end

