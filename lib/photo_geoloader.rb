class PhotoGeoloader
  
  attr_accessor :photo_path, :data, :attributes
  
  def initialize(photo_path, attributes = [:latitude, :longitude, :altitude])
    self.photo_path = photo_path
    self.attributes = attributes
    load_exif_data
  end
  
  def load_exif_data
    self.data = EXIFR::JPEG.new(photo_path).exif.to_a.first
  end
  
  def place_attributes(model)
    success = false
    attributes.each do |attr|
      if model.respond_to? attr
        model.send "#{attr}=".to_sym, data.fields[:gps].fields["gps_#{attr}".to_sym].to_f
        success = true
      end
    end
    success
  end
  
end