class CreateWallTable < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.string :description
      t.integer :height
      t.integer :width
      t.string :image
    end
  end
end
