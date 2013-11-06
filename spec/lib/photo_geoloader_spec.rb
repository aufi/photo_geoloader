require 'spec_helper.rb'

describe PhotoGeoloader do

  let(:photo_geoloader){ PhotoGeoloader.new('spec/support/test_photo_1.jpg') }

  describe 'load data from photo' do    
    it 'loads exif from photo' do
      expect(photo_geoloader.data).not_to be_nil
    end
    
    it 'places attrs from photo to model' do
      model = TestModel.new
      photo_geoloader.place_attributes model
      expect(model.latitude).not_to be_nil
      expect(model.latitude).not_to eq 0.0      
      expect(model.latitude).to eq photo_geoloader.data.fields[:gps].fields[:gps_latitude].to_f
    end
  end
end