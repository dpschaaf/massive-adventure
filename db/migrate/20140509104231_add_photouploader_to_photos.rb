class AddPhotouploaderToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_file
  end
end
