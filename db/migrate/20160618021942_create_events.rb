class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, index: true, null: false
      t.datetime :start, index: true, null: false
      t.datetime :end, index: true, null: false
      t.string :name_of_location
      t.string :address, index: true
      t.float :latitude, index: true, null: false
      t.float :longitude, index: true, null: false
      t.text :description
#      t.binary :header_image
#      t.binary :icon_image
#      t.time :submission_grace_period
#      t.boolean :submission_open, null: false
      t.integer :status, index: true, null: false, default: 0

      t.timestamps null: false
    end

    # Add uniqueness test on events
    add_index :events, [:name, :start, :latitude, :longitude], unique: true
  end
end
