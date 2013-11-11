PhotoGeoloader
===============

[![Gem Version](https://badge.fury.io/rb/photo_geoloader.png)](http://badge.fury.io/rb/photo_geoloader)
[![Build Status](https://travis-ci.org/aufi/photo_geoloader.png)](https://travis-ci.org/aufi/photo_geoloader)

Ruby gem loading GPS position from photo's EXIF informations into (Rails) models.

Created and tested for photos from iPhone and placing it to model.

Usage
-----
Simplest - load position data and handle on your own
```
photo = PhotoGeoloader.new('path/to/photo.jpg')
p photo.position[:latitude]
p photo.position[:longitude]
p photo.position[:altitude]
```
Rails model example
```
# attributes: photo (string, carrierwave uploader), latitude (float), longitude (float), altitude (float)
class Photo < ActiveRecord::Base
  attr_accessible :photo
  mount_uploader :photo, MyPhotoUploader
  before_create do
    PhotoGeoloader.new(photo.path).place_attributes self
  end
end
```

License
-------
Released under [MIT license](https://github.com/aufi/photo_geoloader/blob/master/LICENSE)