require 'spec_helper'

describe Surfline::Client do
  it 'has a base URI' do
    expect(Surfline::Client::BASE_URI).to eq('http://api.surfline.com/v1/forecasts')
  end

  before(:each) do
    @client = Surfline::Client.new
  end

  it 'fetches' do
    data = JSON.parse(@client.send(:fetch, 4248, 'surf'))

    expect(data).not_to be_empty
    ['Surf', 'Location', 'lat', 'lon'].each do |key|
      expect(data).to have_key(key)
    end
  end

  it 'fetches surf' do
    swell_data = JSON.parse(@client.surf('windandsea'))
    expect(swell_data).not_to be_empty
  end

  it 'fetches tide' do
    tide_data = JSON.parse(@client.tide('windandsea'))
    expect(tide_data).not_to be_empty
  end

  it 'fetches wind' do
    wind_data = JSON.parse(@client.wind('windandsea'))
    expect(wind_data).not_to be_empty
  end

  it 'fetches analysis' do
    analysis_data = JSON.parse(@client.analysis('windandsea'))
    expect(analysis_data).not_to be_empty
  end

end
