# HAMPI_LATITUDE = 15.322677
# HAMPI_LONGITUDE = 76.464322

# hampi_album = {title: 'Hampi',
#                description: 'My favorite place in India',
#                city: 'Hampi',
#                country: 'India',
#                arrival_date: Date.new(2013,9,27),
#                departure_date: Date.new(2013,9,29),
#                latitude: 15.3331898,
#                longitude: 76.4633347
# }

# hampi_album = Album.create(hampi_album)

# hampi_photos = ['https://lh3.googleusercontent.com/-3k5FYw1a9YI/UoEMa0W6o1I/AAAAAAAABFk/CfmATMl_ABo/w813-h542-no/IMG_0050.JPG',
#                 'https://lh4.googleusercontent.com/-eYkN-VRxpj0/UoEOdimc4_I/AAAAAAAABHE/4gfxbR9lpO4/w813-h542-no/IMG_0208.JPG',
#                 'https://lh6.googleusercontent.com/-lPIR6_NYXCk/UoEKTs6q2zI/AAAAAAAABFU/W3izcDgakKQ/w813-h542-no/IMG_0040.JPG',
#                 'https://lh6.googleusercontent.com/-CvWjqHaT8wo/UoEH6mcC0SI/AAAAAAAABFI/2985eb40V3M/w813-h542-no/IMG_0146.JPG',
#                 'https://lh6.googleusercontent.com/-pc_J3yLTi_A/UoENowJx1nI/AAAAAAAABGo/2uWYxBaoklU/w813-h542-no/IMG_0171.JPG',
#                 'https://lh3.googleusercontent.com/-RQUniR7bTHo/UoEP6WtMD_I/AAAAAAAABH8/cWWgxosWLh4/w813-h542-no/IMG_0299.JPG',
#                 'https://lh5.googleusercontent.com/-bARslHaC4Yw/UoEQooHRFYI/AAAAAAAABIU/lXEzXnJQ46k/w813-h542-no/IMG_0330.JPG',
#                 'https://lh4.googleusercontent.com/-FjCbgGqK1J4/UoERA7BLubI/AAAAAAAABIg/XhrdrsPlsns/w813-h542-no/IMG_0353.JPG',
#                 'https://lh3.googleusercontent.com/-7h8TzM0VH1I/UoERhFZp69I/AAAAAAAABI0/Bwwj988VK8k/w813-h542-no/IMG_0418.JPG',
#                 'https://lh6.googleusercontent.com/-FyvUEWn4guE/UoER2Ikg5iI/AAAAAAAABJM/jMKABrFDXZA/w813-h542-no/IMG_0429.JPG']

# hampi_album_photos = hampi_photos.map { |photo| Photo.create( latitude: HAMPI_LATITUDE + (0..9).to_a.sample*0.0015,
#                                           longitude: HAMPI_LONGITUDE + (0..9).to_a.sample*0.0015,
#                                           url: photo,
#                                           title: "Hampi",
#                                           description: 'My favorite place in India') }

# hampi_album.photos << hampi_album_photos
# hampi_album.save!


require 'exifr'
require 'uri'

site = "Pulau Tioman"

remote_directory = URI.escape("http://www.daveschaaf.com/travel/#{site}")
local_directory = "/Volumes/Mac Backup/Malaysia/Pulau Tioman"

locations = {
   "SFO"=>[37.621313, -122.37895],
   "Singapore"=>[1.3185848, 103.8455665],
   "Phuket"=>[7.9034596, 98.29248],
   "Pulau Tioman"=>[2.8064825, 104.170334],
   "Sri Lanka"=>[7.293038, 80.6385],
   "Bangalore"=>[12.9308681, 77.6280534],
   "Hong Kong"=>[22.281032, 114.151355],
   "Kochi"=>[9.9639005, 76.2545944],
   "Alleppey"=>[9.4828804, 76.3762234],
   "Hampi"=>[15.3331898, 76.4633347],
   "Coonor"=>[11.350517, 76.810497],
   "Phnom Penh"=>[11.5724717, 104.9289601],
   "Siem Reap"=>[13.3416274, 103.8629545],
   "Koh Rong"=>[10.7603832, 103.2583631],
   "Jaipur"=>[26.9379439, 75.8592224],
   "Agra"=>[27.175015, 78.042155],
   "Delhi"=>[28.6030523, 77.2423442],
   "Istanbul"=>[41.012732, 28.978713],
   "Khajuraho"=>[24.8522879, 79.9213288],
   "Andaman Islands"=>[12.0347219, 92.9990131],
   "Bangkok"=>[13.7592371, 100.4972945],
   "Sukhothai"=>[17.014511, 99.822936],
   "Chiang Mai"=>[18.7919774, 98.9913353],
   "Yangon"=>[16.7991704, 96.14624],
   "Bagan"=>[21.185197, 94.886556],
   "Inle Lake"=>[20.6583147, 96.9313623],
   "Tachileik"=>[20.4484457, 99.8872393],
   "Chiang Rai"=>[19.9029292, 99.8365673],
   "Chiang Khong"=>[20.2743301, 100.4048031],
   "Huay Xai"=>[20.2731582, 100.4148764],
   "Luang Prabang"=>[19.8947774, 102.1415019],
   "Hanoi"=>[21.0360092, 105.8503477],
   "Ha Long Bay"=>[20.9461867, 107.0031452],
   "Hoi An"=>[15.888631, 108.3450479]
}


album = {
  title: 'Pulau Tioman',
  description: "Received my open water scuba certification in Malaysia",
  site: site,
  city: "Pulau Tioman",
  country: "Malaysia",
  latitude: locations[site][0],
  longitude: locations[site][1]
}

new_album = Album.create(album)

Dir.chdir local_directory
photos = Dir['*.{JPG,jpg}']
Dir.chdir APP_ROOT

dates = []

photos.each do |pic|

  photo_info = {
  latitude: locations[site][0]+((0..9).to_a.sample*0.002*(-1)**(0..9).to_a.sample),
  longitude: locations[site][1]+((0..9).to_a.sample*0.002*(-1)**(0..9).to_a.sample),
  url: "#{remote_directory}/#{pic}",
  title: site
  }

  image_data = EXIFR::JPEG.new("#{local_directory}/#{pic}")
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

new_album.arrival_date = dates.min
new_album.departure_date = dates.max

p new_album
p new_album.photos