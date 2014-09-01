class AddLengthAndWidthToFrames < ActiveRecord::Migration
  def change
    add_column :frames, :length, :integer
    add_column :frames, :width, :integer
  end
end
