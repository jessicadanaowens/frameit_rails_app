# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [200, 200]

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :rotate90 do
    process :my_rotate => "-90>"
  end

  # def my_rotate
  #   manipulate! do |image|
  #     image.rotate(-90)
  #   end
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
