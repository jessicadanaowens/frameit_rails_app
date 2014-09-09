class CreateShareTable < ActiveRecord::Migration
  def change
    create_table :share_tables do |t|
      t.integer :user_id
      t.integer :picture_id
      t.string :image
    end
  end
end
