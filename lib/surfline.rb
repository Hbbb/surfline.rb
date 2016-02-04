require 'json'
require 'surfline/version'
require 'surfline/client'
require 'surfline/models/base'
require 'surfline/models/surf'
require 'surfline/models/tide'
require 'surfline/models/wind'
require 'surfline/models/analysis'
require 'surfline/spot_map'

module Surfline
  def self.surf(spot)
    resp = JSON.parse(Client.surf(spot))
    Models::Surf.new(resp)
  end

  def self.wind(spot)
    resp = JSON.parse(Client.wind(spot))
    Models::Wind.new(resp)
  end

  def self.tide(spot)
    resp = JSON.parse(Client.tide(spot))
    Models::Tide.new(resp)
  end

  def self.analysis(spot)
    resp = JSON.parse(Client.analysis(spot))
    Models::Analysis.new(resp)
  end
end
