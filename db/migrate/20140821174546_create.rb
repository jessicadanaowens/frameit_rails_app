class Create < ActiveRecord::Migration
  def change
    create_table :frame_size_join do |t|
      t.string :frame_id
      t.string :frame_size_id
      t.timestamps
    end
  end
end
