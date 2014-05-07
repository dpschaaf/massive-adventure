HAMPI_LATITUDE = 15.322677
HAMPI_LONGITUDE = 76.464322

hampi_album = {title: 'Hampi',
               description: 'My favorite place in India',
               city: 'Hampi',
               country: 'India',
               arrival_date: Date.new(2013,9,27),
               departure_date: Date.new(2013,9,29),
               latitude: 15.3331898,
               longitude: 76.4633347
}

hampi_album = Album.create(hampi_album)

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

hampi_album_photos = hampi_photos.map { |photo| Photo.create( latitude: HAMPI_LATITUDE + (0..9).to_a.sample*0.0015,
                                          longitude: HAMPI_LONGITUDE + (0..9).to_a.sample*0.0015,
                                          url: photo,
                                          title: "Hampi",
                                          description: 'My favorite place in India') }

hampi_album.photos << hampi_album_photos
hampi_album.save!