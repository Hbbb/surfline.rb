$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'surfline'
require 'webmock/rspec'
require 'pry-byebug'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'http://api.surfline.com/v1/forecasts/4248?days=1&resources=surf').
      with(headers: {'Accept': '*/*; q=0.5, application/xml', 'Accept-Encoding': 'gzip, deflate', 'User-Agent': 'Ruby'}).
      to_return(status: 200, body: File.open('./spec/fixtures/surf_data.json'){|f| f.read}, headers: {})

    stub_request(:get, 'http://api.surfline.com/v1/forecasts/4248?days=1&resources=wind').
      with(headers: {'Accept': '*/*; q=0.5, application/xml', 'Accept-Encoding': 'gzip, deflate', 'User-Agent': 'Ruby'}).
      to_return(status: 200, body: File.open('./spec/fixtures/wind_data.json'){|f| f.read}, headers: {})

    stub_request(:get, 'http://api.surfline.com/v1/forecasts/4248?days=1&resources=tide').
      with(headers: {'Accept': '*/*; q=0.5, application/xml', 'Accept-Encoding': 'gzip, deflate', 'User-Agent': 'Ruby'}).
      to_return(status: 200, body: File.open('./spec/fixtures/tide_data.json'){|f| f.read}, headers: {})

    stub_request(:get, 'http://api.surfline.com/v1/forecasts/4248?days=1&resources=analysis').
      with(headers: {'Accept': '*/*; q=0.5, application/xml', 'Accept-Encoding': 'gzip, deflate', 'User-Agent': 'Ruby'}).
      to_return(status: 200, body: File.open('./spec/fixtures/analysis_data.json'){|f| f.read}, headers: {})
  end
end
