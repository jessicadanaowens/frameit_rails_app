class CreateFramesizejoins < ActiveRecord::Migration
  def change
    create_table :framesizejoins do |t|
      t.string :frame_id
      t.string :frame_size_id
      t.timestamps
    end
  end
end
