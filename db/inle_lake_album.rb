site = "Inle Lake"

remote_directory = URI.escape("http://www.daveschaaf.com/travel/#{site}")
local_directory = "/Volumes/Mac Backup/Myanmar/Inle Lake/#{site}"

album = {
  title: site,
  description: "The iconic site of Myanmar, a lake with an entire village on it",
  site: site,
  city: "Nyaungshwe",
  country: "Myanmar",
  latitude: LOCATIONS[site][0],
  longitude: LOCATIONS[site][1]
}

new_album = Album.create(album)

#Dir.chdir local_directory
photos = ["IMG_0031.JPG", "IMG_0088.JPG", "IMG_0145.JPG", "IMG_0259.JPG", "IMG_0332.JPG", "IMG_0353.JPG", "IMG_0451.JPG", "IMG_0482.JPG", "IMG_0648.JPG", "IMG_0763.JPG"] #Dir['*.{JPG,jpg}']
#Dir.chdir APP_ROOT

seed_photo_album(site, new_album, photos, remote_directory)