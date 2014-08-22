class ChangeFrameSizeJoinToFrameSizeJoins < ActiveRecord::Migration
  def change
    rename_table :frame_size_join, :frame_size_joins

  end
end
