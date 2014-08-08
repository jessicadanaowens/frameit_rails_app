class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
    end
  end
end
