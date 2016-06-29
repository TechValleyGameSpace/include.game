class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name, index: true, null: false
      t.references :submission, index: true, foreign_key: true
      t.string :platforms, index: true
      t.attachment :file, null: false
      t.string :file_fingerprint, null: false

      t.timestamps null: false
    end
  end
end
