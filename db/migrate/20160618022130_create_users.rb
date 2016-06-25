class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true, unique: true, null: false
      t.string :email, :string, null: false
      t.string :password_digest, null: false
      t.binary :profile_image
      t.string :real_name
      t.text :description
      t.float :latitude, index: true, null: false
      t.float :longitude, index: true, null: false
      t.integer :status, index: true, null: false
      t.timestamps null: false
    end
  end
end
