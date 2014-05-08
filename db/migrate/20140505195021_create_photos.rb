class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.float :latitude
      t.float :longitude
      t.string :url
      t.string :title
      t.string :description
      t.date :date_time
      t.integer :height
      t.integer :width
      t.float :aspect_ratio
      t.string :make
      t.string :model
      t.timestamps
    end
  end
end
