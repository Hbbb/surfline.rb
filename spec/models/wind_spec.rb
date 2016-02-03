require 'spec_helper'

describe Surfline::Models::Wind do
  let(:data) { JSON.parse(File.open('./spec/fixtures/wind_data.json'){|f| f.read}) }

  before(:each) do
    @model = Surfline::Models::Wind.new data
  end

  describe '#direction' do
    it 'returns the correct wind direction for all time segments' do
      segment_1 = Time.new(2016, 2, 2, 2,13,25)
      segment_2 = Time.new(2016, 2, 2, 6,5,19)
      segment_3 = Time.new(2016, 2, 2, 10,0,0)
      segment_4 = Time.new(2016, 2, 2, 12,0,0)
      segment_5 = Time.new(2016, 2, 2, 14,0,0)
      segment_6 = Time.new(2016, 2, 2, 19,0,0)
      segment_7 = Time.new(2016, 2, 2, 21,0,0)
      segment_8 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.direction(segment_1)).to eq(data['Wind']['wind_direction'].first.first)
      expect(@model.direction(segment_2)).to eq(data['Wind']['wind_direction'].first[1])
      expect(@model.direction(segment_3)).to eq(data['Wind']['wind_direction'].first[2])
      expect(@model.direction(segment_4)).to eq(data['Wind']['wind_direction'].first[3])
      expect(@model.direction(segment_5)).to eq(data['Wind']['wind_direction'].first[4])
      expect(@model.direction(segment_6)).to eq(data['Wind']['wind_direction'].first[5])
      expect(@model.direction(segment_7)).to eq(data['Wind']['wind_direction'].first[6])
      expect(@model.direction(segment_8)).to eq(data['Wind']['wind_direction'].first[7])
    end
  end

  describe '#speed' do
    it 'returns the correct wind speed for all time segments' do
      segment_1 = Time.new(2016, 2, 2, 2,13,25)
      segment_2 = Time.new(2016, 2, 2, 6,5,19)
      segment_3 = Time.new(2016, 2, 2, 10,0,0)
      segment_4 = Time.new(2016, 2, 2, 12,0,0)
      segment_5 = Time.new(2016, 2, 2, 14,0,0)
      segment_6 = Time.new(2016, 2, 2, 19,0,0)
      segment_7 = Time.new(2016, 2, 2, 21,0,0)
      segment_8 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.speed(segment_1)).to eq(data['Wind']['wind_speed'].first.first)
      expect(@model.speed(segment_2)).to eq(data['Wind']['wind_speed'].first[1])
      expect(@model.speed(segment_3)).to eq(data['Wind']['wind_speed'].first[2])
      expect(@model.speed(segment_4)).to eq(data['Wind']['wind_speed'].first[3])
      expect(@model.speed(segment_5)).to eq(data['Wind']['wind_speed'].first[4])
      expect(@model.speed(segment_6)).to eq(data['Wind']['wind_speed'].first[5])
      expect(@model.speed(segment_7)).to eq(data['Wind']['wind_speed'].first[6])
      expect(@model.speed(segment_8)).to eq(data['Wind']['wind_speed'].first[7])
    end
  end

  describe '#report' do
    it 'returns the correct wind report for all time segments' do
      segment_1 = Time.new(2016, 2, 2, 2,13,25)
      segment_2 = Time.new(2016, 2, 2, 6,5,19)
      segment_3 = Time.new(2016, 2, 2, 10,0,0)
      segment_4 = Time.new(2016, 2, 2, 12,0,0)
      segment_5 = Time.new(2016, 2, 2, 14,0,0)
      segment_6 = Time.new(2016, 2, 2, 19,0,0)
      segment_7 = Time.new(2016, 2, 2, 21,0,0)
      segment_8 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.report(segment_1)).to eq({direction: data['Wind']['wind_direction'].first.first, speed: data['Wind']['wind_speed'].first.first})
      expect(@model.report(segment_2)).to eq({direction: data['Wind']['wind_direction'].first[1], speed: data['Wind']['wind_speed'].first[1]})
      expect(@model.report(segment_3)).to eq({direction: data['Wind']['wind_direction'].first[2], speed: data['Wind']['wind_speed'].first[2]})
      expect(@model.report(segment_4)).to eq({direction: data['Wind']['wind_direction'].first[3], speed: data['Wind']['wind_speed'].first[3]})
      expect(@model.report(segment_5)).to eq({direction: data['Wind']['wind_direction'].first[4], speed: data['Wind']['wind_speed'].first[4]})
      expect(@model.report(segment_6)).to eq({direction: data['Wind']['wind_direction'].first[5], speed: data['Wind']['wind_speed'].first[5]})
      expect(@model.report(segment_7)).to eq({direction: data['Wind']['wind_direction'].first[6], speed: data['Wind']['wind_speed'].first[6]})
      expect(@model.report(segment_8)).to eq({direction: data['Wind']['wind_direction'].first[7], speed: data['Wind']['wind_speed'].first[7]})
    end
  end
end
