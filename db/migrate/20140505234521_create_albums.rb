class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.string :country
      t.string :city
      t.string :site
      t.date  :arrival_date
      t.date :departure_date
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
