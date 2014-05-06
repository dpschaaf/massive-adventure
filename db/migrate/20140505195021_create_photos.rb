class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.float :latitude
      t.float :longitude
      t.string :url
      t.string :title
      t.string :description
    end
  end
end
