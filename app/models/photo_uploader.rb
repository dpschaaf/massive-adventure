require 'rubygems'
require 'carrierwave'
require 'fog'
require 'mini_magick'

# storage = Fog::Storage.new({
#   :local_root => '~/Dave/massive-adventure/fog',
#   :provider   => 'Local'
# })

# # create a directory
# directory = storage.directories.create(
#   :key => 'data'
# )

# # check storage directories from inside fog
# p storage.directories

# # create a file inside our new directory
# file = directory.files.create(
#   :body => 'Hello World!',
#   :key  => 'hello_world.txt'
# )

# # see what files you have from inside fog
# p directory.files

# # clean up the mess
# file.destroy
# directory.destroy

Fog.mock!
storage = Fog::Storage.new({
  :aws_access_key_id      => 'fake_access_key_id',
  :aws_secret_access_key  => 'fake_secret_access_key',
  :provider               => 'AWS'
})