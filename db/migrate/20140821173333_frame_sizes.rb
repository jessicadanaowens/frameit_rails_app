class FrameSizes < ActiveRecord::Migration
  def change
    create_table :frame_sizes do |t|
      t.integer :height
      t.integer :width
      t.timestamps
    end
  end
end
