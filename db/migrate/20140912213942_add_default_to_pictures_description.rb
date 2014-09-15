class AddDefaultToPicturesDescription < ActiveRecord::Migration
  def change
    change_column :pictures, :file_name, :string, :default => "add description"
  end
end
