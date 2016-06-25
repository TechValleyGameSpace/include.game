class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, index: true, null: false
      t.date :start, index: true, null: false
      t.date :end, index: true, null: false
      t.float :latitude, index: true, null: false
      t.float :longitude, index: true, null: false
      t.text :description
      t.binary :header_image
      t.binary :icon_image
      t.date :submission_grace_period
      t.boolean :submission_open, null: false
      t.integer :status, index: true, null: false

      t.timestamps null: false
    end

    # Add uniqueness test on events
    add_index :events, [:name, :start, :latitude, :longitude], unique: true
  end
end
