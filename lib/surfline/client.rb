require 'rest-client'

module Surfline
  class Client
    include RestClient

    BASE_URI = 'http://api.surfline.com/v1/forecasts'

    def surf(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'surf')
    end

    def tide(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'tide')
    end

    def wind(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'wind')
    end

    def analysis(spot)
      fetch(Surfline::SPOT_MAP[spot.to_sym], 'analysis')
    end

    private

    def fetch(spot_id, resource)
      RestClient.get("#{BASE_URI}/#{spot_id}?resources=#{resource}&days=1")
    end
  end
end
