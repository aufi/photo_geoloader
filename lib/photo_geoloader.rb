class PhotoGeoloader
  
  attr_accessor :photo_path, :data, :attributes, :position
  
  def initialize(photo_path, attributes = [:latitude, :longitude, :altitude])
    self.photo_path = photo_path
    self.attributes = attributes
    self.position = {}
    load_exif_data
  end
  
  def load_exif_data
    self.data = EXIFR::JPEG.new(photo_path).exif.to_a.first
    attributes.each do |attr|
      self.position[attr.to_sym] = data.fields[:gps].fields["gps_#{attr}".to_sym].to_f
    end
  end
  
  def place_attributes(model)
    success = false
    attributes.each do |attr|
      if model.respond_to? attr
        model.send "#{attr}=".to_sym, position[attr.to_sym]
        success = true
      end
    end
    success
  end
  
end