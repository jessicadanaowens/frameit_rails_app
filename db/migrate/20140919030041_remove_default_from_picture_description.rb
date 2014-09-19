class RemoveDefaultFromPictureDescription < ActiveRecord::Migration
  def change
    change_column :pictures, :file_name, :string
  end
end
