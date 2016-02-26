require 'spec_helper'

describe Surfline::Models::Tide do
  let(:data) { JSON.parse(File.open('./spec/fixtures/tide_data.json'){|f| f.read}) }

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
      t = Time.new(2015, 11, 28, 12,00,00)
      expect(@model.tide_at(t)).to eq(data['Tide']['dataPoints'][5])
    end

    it 'returns the tide closest to a given time' do
      t = Time.new(2015, 11, 28, 2,13,25)
      expect(@model.tide_at(t)).to eq(data['Tide']['dataPoints'][23])
    end
  end

  describe '#full_report' do
    it 'returns an array of tide data points for the day' do
      report_date = DateTime.parse(data['_metadata']['dateCreated'])

      expected = data['Tide']['dataPoints'].select do |data|
        DateTime.parse(data['Localtime']).day == report_date.day
      end

      expect(@model.full_report).to eq(expected)
    end
  end
end
