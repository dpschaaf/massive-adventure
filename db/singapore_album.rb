require 'exifr'
require 'uri'

site = "Singapore"

remote_directory = URI.escape("http://www.daveschaaf.com/travel/#{site}")
local_directory = "/Volumes/Mac Backup/#{site}/#{site}"

album = {
  title: site,
  description: "Lived and worked in Singapore for 3 month. The first place I visited in Asia.",
  site: site,
  city: site,
  country: site,
  latitude: LOCATIONS[site][0],
  longitude: LOCATIONS[site][1]
}

new_album = Album.create(album)

# Dir.chdir local_directory
photos = ["IMG_0941.JPG", "IMG_0945.JPG", "IMG_0962.JPG", "IMG_0995.JPG", "IMG_1044.JPG", "IMG_1057.JPG", "IMG_1096.JPG", "IMG_1125.JPG", "IMG_1147.JPG"]#Dir['*.{JPG,jpg}']
# Dir.chdir APP_ROOT

dates = []

photos.each do |pic|

  photo_info = {
  latitude: LOCATIONS[site][0]+((0..9).to_a.sample*0.002*(-1)**(0..9).to_a.sample),
  longitude: LOCATIONS[site][1]+((0..9).to_a.sample*0.002*(-1)**(0..9).to_a.sample),
  url: "#{remote_directory}/#{pic}",
  title: site
  }

  image_data = EXIFR::JPEG.new("#{remote_directory}/#{pic}")
  if image_data.exif?
    photo_info[:height] = image_data.height #EXIF
    photo_info[:width] = image_data.width #EXIF
    photo_info[:aspect_ratio] = image_data.width/image_data.height.to_f #EXIF
    photo_info[:make] = image_data.make #EXIF
    photo_info[:model] = image_data.model #EXIF
    photo_info[:date_time] = image_data.date_time #EXIF
  end

  dates << image_data.date_time


  new_album.photos.create(photo_info)
end

dates.compact!
new_album.arrival_date = dates.min
new_album.departure_date = dates.max
new_album.save!