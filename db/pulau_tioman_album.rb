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

seed_photo_album(site, new_album, photos, remote_directory)
