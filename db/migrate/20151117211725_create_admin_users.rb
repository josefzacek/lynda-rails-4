class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :username, limit: 25
      t.string :email, limit: 25
      t.string :hashed_password

      t.timestamps null: false
    end
  end
end
