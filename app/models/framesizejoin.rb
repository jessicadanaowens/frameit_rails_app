class Framesizejoin < ActiveRecord::Base
  has_many :frames
  has_many :frame_sizes

end