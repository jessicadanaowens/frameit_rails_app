class CreateArrangement < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|
      t.references :user
      t.string :url
    end
  end
end
