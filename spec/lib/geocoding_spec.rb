require "rails_helper"

RSpec.describe Geocoding do
  subject { described_class.new(address).location }

  describe "#location" do
    context "when address is invalid" do
      let(:address) { nil }
      let(:error_message) { 'error message' }

      before do
        stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=&key=#{ENV['GOOGLE_GEOCODE_API_KEY']}").
          with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(status: 400, body: { error_message: error_message }.to_json, headers: {})
      end

      it "returns a location object with the result" do
        expect(subject.success?).to be_falsey
        expect(subject.message).to eq(error_message)
        expect(subject.code).to eq(400)
      end
    end

    context "when address is valid" do
      let(:address) { 'address'}
      let(:latitude) { 10 }
      let(:longitude) { 10 }

      let(:response) do
        {
          results: [{
            geometry: {
              location: {
                lat: latitude,
                lng: longitude
              }
            }
          }]
        }
      end

      before do
        stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{ENV['GOOGLE_GEOCODE_API_KEY']}").
          with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: response.to_json, headers: {})
      end

      it "returns a location object with the result" do
        expect(subject.success?).to be_truthy
        expect(subject.latitude).to eq(latitude)
        expect(subject.longitude).to eq(longitude)
      end
    end
  end
end
