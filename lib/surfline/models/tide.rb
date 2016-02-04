require 'date'

module Surfline
  module Models
    class Tide < Base
      def initialize(data)
        @data = data['Tide']['dataPoints'] if data['Tide']

        if @data == nil
          raise 'Invalid Surfline Tide data'
        end
      end

      def high
        @data.select { |datum| datum['type'].match(/high/i) }
      end

      def low
        @data.select { |datum| datum['type'].match(/low/i) }
      end

      # Using closest_tide, return the tide at a given time
      def tide_at(time)
        time = time.class == Time ? time : Time.new(time)
        closest_tide(time)
      end

      # Look at the next tide in the list and see if its higher or lower
      def tide_direction(time)
        time = time.class == Time ? time : Time.new(time)
        closest_tide(time + 1.hour)['height'] > closest_tide(time)['height'] ? 'rising' : 'falling'
      end

      private

      # Given a time, return the closest tide data point
      def closest_tide(time)
        time = time.class == Time ? time : Time.new(time)
        @data.min_by { |x| (DateTime.parse(x['utctime']).hour - time.hour).abs }
      end

    end
  end
end
