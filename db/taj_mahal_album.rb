site = "Taj Mahal"

remote_directory = URI.escape("http://www.daveschaaf.com/travel/#{site}")
local_directory = "/Volumes/Mac Backup/India/Agra/#{site}/#{site}"

album = {
  title: 'The Treasure of India',
  description: "Lived and worked in Singapore for 3 month. The first place I visited in Asia.",
  site: site,
  city: "Agra",
  country: "India",
  latitude: LOCATIONS[site][0],
  longitude: LOCATIONS[site][1]
}

new_album = Album.create(album)

# Dir.chdir local_directory
photos = ["IMG_4143.JPG", "IMG_4159.JPG", "IMG_4163.JPG", "IMG_4218.JPG", "IMG_4276.JPG", "IMG_4353.JPG", "IMG_4358.JPG", "IMG_4374.JPG", "IMG_4395.JPG", "IMG_4416.JPG", "IMG_4439.JPG"]#Dir['*.{JPG,jpg}']
# Dir.chdir APP_ROOT

seed_photo_album(site, new_album, photos, remote_directory)