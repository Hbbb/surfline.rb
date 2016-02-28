require 'spec_helper'

describe Surfline::Models::Tide do
  spot_data = JSON.parse(File.open('./spec/fixtures/reports/spots/tide_data.json'){|f| f.read})
  region_data = JSON.parse(File.open('./spec/fixtures/reports/regions/tide_data.json'){|f| f.read})

  shared_examples 'tide_model' do |data|
    before(:each) do
      @model = Surfline::Models::Tide.new data
    end

    describe '#high' do
      it 'returns the high tide object' do
        expect(@model.high).to eq(data['Tide']['dataPoints'].select { |t| t['type'].match(/high/i) })
      end
    end

    describe '#low' do
      it 'returns the low tide object' do
        expect(@model.low).to eq(data['Tide']['dataPoints'].select { |t| t['type'].match(/low/i) })
      end
    end

    describe '#tide_at' do
      it 'returns the tide at a given time' do
        t = Time.new(2016, 02, 27, 12,00,00)
        expect(@model.tide_at(t)).to eq(data['Tide']['dataPoints'][4])
      end

      it 'returns the tide closest to a given time' do
        t = Time.new(2016, 02, 27, 2,13,25)
        expect(@model.tide_at(t)).to eq(data['Tide']['dataPoints'][23])
      end
    end

    describe '#full_report' do
      it 'returns an array of tide data points for the day' do
        report_date = DateTime.parse(data['_metadata']['dateCreated'])

        expected = data['Tide']['dataPoints'].select do |datum|
          DateTime.parse(datum['Localtime']).day == report_date.day
        end

        expect(@model.full_report).to eq(expected)
      end
    end
  end

  context 'with spot data' do
    include_examples 'tide_model', spot_data
  end

  context 'with region data' do
    include_examples 'tide_model', region_data
  end

end
