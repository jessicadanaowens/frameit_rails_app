class AddHeightAndWidthToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :height, :integer
    add_column :pictures, :width, :integer
  end
end
