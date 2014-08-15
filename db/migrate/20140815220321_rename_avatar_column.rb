class RenameAvatarColumn < ActiveRecord::Migration
  def change
    rename_column :pictures, :avatar, :image
  end
end
