require 'spec_helper'

describe Surfline::Models::Wind do
  let(:data) { JSON.parse(File.open('./spec/fixtures/wind_data.json'){|f| f.read}) }

  before(:each) do
    @model = Surfline::Models::Wind.new data
  end

  describe '#full_report' do
    it 'returns a full wind report' do
      expected = [
        {
          direction: data['Wind']['wind_direction'].flatten[0],
          speed: data['Wind']['wind_speed'].flatten[0],
          datestamp: data['Wind']['dateStamp'].flatten[0],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[1],
          speed: data['Wind']['wind_speed'].flatten[1],
          datestamp: data['Wind']['dateStamp'].flatten[1],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[2],
          speed: data['Wind']['wind_speed'].flatten[2],
          datestamp: data['Wind']['dateStamp'].flatten[2],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[3],
          speed: data['Wind']['wind_speed'].flatten[3],
          datestamp: data['Wind']['dateStamp'].flatten[3],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[4],
          speed: data['Wind']['wind_speed'].flatten[4],
          datestamp: data['Wind']['dateStamp'].flatten[4],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[5],
          speed: data['Wind']['wind_speed'].flatten[5],
          datestamp: data['Wind']['dateStamp'].flatten[5],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[6],
          speed: data['Wind']['wind_speed'].flatten[6],
          datestamp: data['Wind']['dateStamp'].flatten[6],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        },
        {
          direction: data['Wind']['wind_direction'].flatten[7],
          speed: data['Wind']['wind_speed'].flatten[7],
          datestamp: data['Wind']['dateStamp'].flatten[7],
          latitude: data['lat'],
          longitude: data['lon'],
          id: data['id']
        }
      ]

      expect(@model.full_report).to eq(expected)
    end
  end
end
