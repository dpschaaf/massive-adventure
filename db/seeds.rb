SEED_PHOTO_DIR = '/Users/Dave/Pictures/Hampi'

HAMPI_LATITUDE = 15.322677
HAMPI_LONGITUDE = 76.464322

hampi_photos = ['https://lh3.googleusercontent.com/-3k5FYw1a9YI/UoEMa0W6o1I/AAAAAAAABFk/CfmATMl_ABo/w813-h542-no/IMG_0050.JPG',
  'https://lh4.googleusercontent.com/-eYkN-VRxpj0/UoEOdimc4_I/AAAAAAAABHE/4gfxbR9lpO4/w813-h542-no/IMG_0208.JPG',
'https://lh6.googleusercontent.com/-lPIR6_NYXCk/UoEKTs6q2zI/AAAAAAAABFU/W3izcDgakKQ/w813-h542-no/IMG_0040.JPG',
'https://lh6.googleusercontent.com/-CvWjqHaT8wo/UoEH6mcC0SI/AAAAAAAABFI/2985eb40V3M/w813-h542-no/IMG_0146.JPG',
'https://lh6.googleusercontent.com/-pc_J3yLTi_A/UoENowJx1nI/AAAAAAAABGo/2uWYxBaoklU/w813-h542-no/IMG_0171.JPG',
'https://lh3.googleusercontent.com/-RQUniR7bTHo/UoEP6WtMD_I/AAAAAAAABH8/cWWgxosWLh4/w813-h542-no/IMG_0299.JPG',
'https://lh5.googleusercontent.com/-bARslHaC4Yw/UoEQooHRFYI/AAAAAAAABIU/lXEzXnJQ46k/w813-h542-no/IMG_0330.JPG',
'https://lh4.googleusercontent.com/-FjCbgGqK1J4/UoERA7BLubI/AAAAAAAABIg/XhrdrsPlsns/w813-h542-no/IMG_0353.JPG',
'https://lh3.googleusercontent.com/-7h8TzM0VH1I/UoERhFZp69I/AAAAAAAABI0/Bwwj988VK8k/w813-h542-no/IMG_0418.JPG',
'https://lh6.googleusercontent.com/-FyvUEWn4guE/UoER2Ikg5iI/AAAAAAAABJM/jMKABrFDXZA/w813-h542-no/IMG_0429.JPG']

hampi_photos.each { |photo| Photo.create(latitude: HAMPI_LATITUDE + (0..9).to_a.sample*0.0015, latitude: HAMPI_LONGITUDE + (0..9).to_a.sample*0.0015, url: photo) }