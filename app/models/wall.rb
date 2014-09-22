class Wall < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :height, :width, :description
  validates_numericality_of :height, :width
end