class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.belongs_to :submission, index: true, null: false

      t.string :name, index: true, null: false
      t.integer :ordinal, index: true, null: false, default: 0
      t.string :platforms, index: true
      t.text :description

      t.attachment :file
      t.string :file_fingerprint
      t.string :link

      t.timestamps null: false
    end

    # Add uniqueness test on names (based on submission)
    add_index :downloads, [:submission, :name], unique: true
    #add_index :downloads, [:submission, :ordinal], unique: true
  end
end
