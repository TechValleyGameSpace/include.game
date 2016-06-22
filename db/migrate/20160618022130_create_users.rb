class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.string :realname
      t.text :description
      t.binary :profile_image

      t.timestamps null: false
    end
  end
end
