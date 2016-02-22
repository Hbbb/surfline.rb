require 'rest-client'

module Surfline
  module Client
    include RestClient

    BASE_URI = 'http://api.surfline.com/v1/forecasts'

    def self.surf(spot)
      spot = lookup(spot)
      fetch(spot, 'surf')
    end

    def self.tide(spot)
      spot = lookup(spot)
      fetch(spot, 'tide')
    end

    def self.wind(spot)
      spot = lookup(spot)
      fetch(spot, 'wind')
    end

    def self.analysis(spot)
      spot = lookup(spot)
      fetch(spot, 'analysis')
    end

    private

    def self.lookup(spot)
      spot = if spot.is_a? Numeric
               spot
             else
               Surfline::SPOT_MAP[spot.to_sym]
             end
    end

    def self.fetch(spot_id, resource)
      RestClient.get("#{BASE_URI}/#{spot_id}?resources=#{resource}&days=1")
    end
  end
end
