require 'spec_helper'

describe Surfline::Models::Surf do
  spot_data = JSON.parse(File.open('./spec/fixtures/reports/spots/surf_data.json'){|f| f.read})
  region_data = JSON.parse(File.open('./spec/fixtures/reports/regions/surf_data.json'){|f| f.read})

  shared_examples 'surf_model' do |data|
    before(:each) do
      @model = Surfline::Models::Surf.new data
    end

    describe '#full_report' do
      it 'returns an array of surf reports for each datestamp' do
        expected = [
          {
            height_1: data['Surf']['swell_height1'].flatten[0],
            height_2: data['Surf']['swell_height2'].flatten[0],
            height_3: data['Surf']['swell_height3'].flatten[0],
            period_1: data['Surf']['swell_period1'].flatten[0],
            period_2: data['Surf']['swell_period2'].flatten[0],
            period_3: data['Surf']['swell_period3'].flatten[0],
            direction_1: data['Surf']['swell_direction1'].flatten[0],
            direction_2: data['Surf']['swell_direction2'].flatten[0],
            direction_3: data['Surf']['swell_direction3'].flatten[0],
            datestamp: data['Surf']['dateStamp'].flatten[0],
            surf_max: data['Surf']['surf_max'].flatten[0],
            surf_min: data['Surf']['surf_min'].flatten[0],
            latitude: data['lat'],
            longitude: data['lon'],
            surfline_id: data['id']
          },
          {
            height_1: data['Surf']['swell_height1'].flatten[1],
            height_2: data['Surf']['swell_height2'].flatten[1],
            height_3: data['Surf']['swell_height3'].flatten[1],
            period_1: data['Surf']['swell_period1'].flatten[1],
            period_2: data['Surf']['swell_period2'].flatten[1],
            period_3: data['Surf']['swell_period3'].flatten[1],
            direction_1: data['Surf']['swell_direction1'].flatten[1],
            direction_2: data['Surf']['swell_direction2'].flatten[1],
            direction_3: data['Surf']['swell_direction3'].flatten[1],
            datestamp: data['Surf']['dateStamp'].flatten[1],
            surf_max: data['Surf']['surf_max'].flatten[1],
            surf_min: data['Surf']['surf_min'].flatten[1],
            latitude: data['lat'],
            longitude: data['lon'],
            surfline_id: data['id']
          },
          {
            height_1: data['Surf']['swell_height1'].flatten[2],
            height_2: data['Surf']['swell_height2'].flatten[2],
            height_3: data['Surf']['swell_height3'].flatten[2],
            period_1: data['Surf']['swell_period1'].flatten[2],
            period_2: data['Surf']['swell_period2'].flatten[2],
            period_3: data['Surf']['swell_period3'].flatten[2],
            direction_1: data['Surf']['swell_direction1'].flatten[2],
            direction_2: data['Surf']['swell_direction2'].flatten[2],
            direction_3: data['Surf']['swell_direction3'].flatten[2],
            datestamp: data['Surf']['dateStamp'].flatten[2],
            surf_max: data['Surf']['surf_max'].flatten[2],
            surf_min: data['Surf']['surf_min'].flatten[2],
            latitude: data['lat'],
            longitude: data['lon'],
            surfline_id: data['id']
          },
          {
            height_1: data['Surf']['swell_height1'].flatten[3],
            height_2: data['Surf']['swell_height2'].flatten[3],
            height_3: data['Surf']['swell_height3'].flatten[3],
            period_1: data['Surf']['swell_period1'].flatten[3],
            period_2: data['Surf']['swell_period2'].flatten[3],
            period_3: data['Surf']['swell_period3'].flatten[3],
            direction_1: data['Surf']['swell_direction1'].flatten[3],
            direction_2: data['Surf']['swell_direction2'].flatten[3],
            direction_3: data['Surf']['swell_direction3'].flatten[3],
            datestamp: data['Surf']['dateStamp'].flatten[3],
            surf_max: data['Surf']['surf_max'].flatten[3],
            surf_min: data['Surf']['surf_min'].flatten[3],
            latitude: data['lat'],
            longitude: data['lon'],
            surfline_id: data['id']
          }
        ]

        expect(@model.full_report).to eq(expected)
      end
    end
  end

  context 'with spot data' do
    include_examples 'surf_model', spot_data
  end

  context 'with region data' do
    include_examples 'surf_model', region_data
  end
end
