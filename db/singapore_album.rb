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

seed_photo_album(site, new_album, photos, remote_directory)
