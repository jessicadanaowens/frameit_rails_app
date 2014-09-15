class ChangeDefaultForPicturesDescription < ActiveRecord::Migration
  def change
    change_column :pictures, :file_name, :string, :default => "+"
  end
end
