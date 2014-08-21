class Frame < ActiveRecord::Base
  has_many :frame_sizes
  has_many :frame_size_joins
end