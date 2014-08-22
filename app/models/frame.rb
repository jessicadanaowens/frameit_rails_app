class Frame < ActiveRecord::Base
  has_many :frame_sizes
  has_many :frame_size_joins

  mount_uploader :image, ImageUploader
end