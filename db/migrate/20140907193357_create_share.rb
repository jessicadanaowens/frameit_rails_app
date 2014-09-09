class CreateShare < ActiveRecord::Migration
  def change
      create_table :shares do |t|
        t.integer :user_id
        t.integer :picture_id
      end
  end
end
