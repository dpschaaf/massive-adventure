class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :description
      t.date :date_time  #exif
      t.integer :height  #exif
      t.integer :width  #exif
      t.float :aspect_ratio  #exif
      t.string :make #exif
      t.string :model #exif
      t.timestamps
    end
  end
end
