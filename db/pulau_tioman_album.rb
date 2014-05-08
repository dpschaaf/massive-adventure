require 'exifr'
require 'uri'

site = "Pulau Tioman"

remote_directory = URI.escape("http://www.daveschaaf.com/travel/#{site}")
local_directory = "/Volumes/Mac Backup/Malaysia/Pulau Tioman"

album = {
  title: 'Pulau Tioman',
  description: "Received my open water scuba certification in Malaysia",
  site: site,
  city: "Pulau Tioman",
  country: "Malaysia",
  latitude: LOCATIONS[site][0],
  longitude: LOCATIONS[site][1]
}

new_album = Album.create(album)

#Dir.chdir local_directory
photos = ["IMG_1127.JPG", "IMG_1128.JPG", "IMG_1129.JPG", "IMG_1130.JPG", "IMG_1131.JPG", "IMG_1132.JPG", "IMG_1133.JPG", "IMG_1134.JPG", "IMG_1135.JPG", "IMG_1136.JPG", "IMG_1137.JPG", "IMG_1138.JPG"] #Dir['*.{JPG,jpg}']
#Dir.chdir APP_ROOT

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