class UpdateArrangementsUrlColumn < ActiveRecord::Migration
  def change
    change_column :arrangements, :url, :text
  end
end
