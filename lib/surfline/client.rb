require 'rest-client'

module Surfline
  module Client
    include RestClient

    BASE_URI = 'http://api.surfline.com/v1/forecasts'

    def self.surf(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'surf')
    end

    def self.tide(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'tide')
    end

    def self.wind(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'wind')
    end

    def self.analysis(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'analysis')
    end

    private

    def self.fetch(spot_id, resource)
      RestClient.get("#{BASE_URI}/#{spot_id}?resources=#{resource}&days=1")
    end
  end
end
