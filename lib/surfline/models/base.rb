module Surfline
  module Models
    class Base
      def initialize(data)
        @raw = data
      end

      private

      def spot_meta
        {
          latitude: @raw['lat'],
          longitude: @raw['lon'],
          id: @raw['id']
        }
      end

      def attr(key)
        if @data[key].class == Array
          @data[key].first
        elsif @data[key]
          @data[key]
        else
          nil
        end
      end

    end
  end
end

