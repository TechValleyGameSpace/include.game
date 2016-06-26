class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true, unique: true, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
#      t.binary :profile_image
      t.string :real_name, index: true
      t.text :description
      t.string :address, index: true
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.integer :status, index: true, null: false, default: 0
      t.timestamps null: false
    end
  end
end
