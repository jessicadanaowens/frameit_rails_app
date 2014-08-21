class AddDimensionsToFrameSizes < ActiveRecord::Migration
  def change
    add_column :frame_sizes, :dimensions, :string
  end
end
