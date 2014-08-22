class AddImageToFrames < ActiveRecord::Migration
  def change
    add_column :frames, :image, :string
  end
end
