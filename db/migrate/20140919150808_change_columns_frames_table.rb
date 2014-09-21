class ChangeColumnsFramesTable < ActiveRecord::Migration
  def change
    remove_column :frames, :length
    remove_column :frames, :width
    add_column :frames, :inner_height, :integer
    add_column :frames, :inner_width, :integer
    add_column :frames, :width_of_moulding, :integer
  end
end
