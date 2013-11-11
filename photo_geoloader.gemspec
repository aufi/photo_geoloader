Gem::Specification.new do |s|
  s.name        = 'photo_geoloader'
  s.version     = '0.1.0'
  s.date        = '2013-11-11'
  s.summary     = "Load GPS coordinates from uploaded photos into models."
  s.description = "Load GPS coordinates from uploaded photos exif meta information into usually Rails models."
  s.authors     = ["Marek Aufart"]
  s.email       = 'aufi.cz@gmail.com'
  s.files       = ["lib/photo_geoloader.rb"]
  s.homepage    = 'https://github.com/aufi/photo_geoloader'
  s.license     = 'MIT'
  
  s.add_dependency 'exifr', "~> 1.1.3"
  
  s.add_development_dependency "rake", "~> 10.1.0"
  #s.add_development_dependency "rails", ">= 3.0.0"
  s.add_development_dependency "rspec", "~> 2.14.1"
  s.add_development_dependency "pry", "~> 0.9.12.2"
end