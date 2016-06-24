class AddLatitudeAndLogitudeToEvent < ActiveRecord::Migration
  def change
    # Add latitude
    add_column :events, :latitude, :float
    add_index :events, :latitude

    # Add longitude
    add_column :events, :longitude, :float
    add_index :events, :longitude

    # Add uniqueness test on events
    add_index :events, [:name, :start, :latitude, :longitude], unique: true
  end
end
