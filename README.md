photo_geoloader
===============

[![Build Status](https://travis-ci.org/aufi/photo_geoloader.png)](https://travis-ci.org/aufi/photo_geoloader)

Ruby gem loading GPS coordinates from photo's EXIF informations into (Rails) models.

Created and tested for photos from iPhone and placing it to model.

**Note: not ready for production use yet**

Usage
-----
Simplest - load position data and handle on your own
```
loader = PhotoGeoloader.new('path/to/photo.jpg')
p loader.position[:latitude]
p loader.position[:longitude]
p loader.position[:altitude]
```
Rails model example (TODO)
```
# photo, latitude, longitude, altitude
class Photo < ActiveRecord::Base
  after_create do
    PhotoGeoloader.new(photo.path).place_attributes self
  end
end
```