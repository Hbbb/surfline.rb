require 'spec_helper'

describe Surfline::Client do

  it 'has a base URI' do
    expect(Surfline::Client::BASE_URI).to eq('http://api.surfline.com/v1/forecasts')
  end

  it 'fetches' do
    data = JSON.parse(Surfline::Client.send(:fetch, 4248, 'surf'))

    expect(data).not_to be_empty
    ['Surf', 'Location', 'lat', 'lon'].each do |key|
      expect(data).to have_key(key)
    end
  end

  it 'fetches surf' do
    swell_data = JSON.parse(Surfline::Client.surf('windandsea'))
    expect(swell_data).not_to be_empty
    ['Surf', 'Location', 'lat', 'lon'].each do |key|
      expect(swell_data).to have_key(key)
    end
  end

  it 'fetches tide' do
    tide_data = JSON.parse(Surfline::Client.tide('windandsea'))
    expect(tide_data).not_to be_empty
    ['Tide', 'Location', 'lat', 'lon'].each do |key|
      expect(tide_data).to have_key(key)
    end
  end

  it 'fetches wind' do
    wind_data = JSON.parse(Surfline::Client.wind('windandsea'))
    expect(wind_data).not_to be_empty
    ['Wind', 'Location', 'lat', 'lon'].each do |key|
      expect(wind_data).to have_key(key)
    end
  end

  it 'fetches analysis' do
    analysis_data = JSON.parse(Surfline::Client.analysis('windandsea'))
    expect(analysis_data).not_to be_empty
    ['Analysis', 'Location', 'lat', 'lon'].each do |key|
      expect(analysis_data).to have_key(key)
    end
  end

end
