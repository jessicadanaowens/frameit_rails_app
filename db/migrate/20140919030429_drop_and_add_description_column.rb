class DropAndAddDescriptionColumn < ActiveRecord::Migration
  def change
    remove_column :pictures, :file_name
    remove_column :pictures, :url
    add_column :pictures, :description, :string
  end
end
