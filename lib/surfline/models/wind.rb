module Surfline
  module Models
    class Wind < Base
      attr_reader :full_report

      def initialize(data)
        super

        begin
          @data = data['Wind']
        rescue NoMethodError
          raise 'Invalid Surfline wind report \n Ensure the API hasnt changed'
        end

        @full_report = []
        @data['dateStamp'].flatten.each_with_index do |stamp, i|
          segment = {}
          segment[:direction] = @data['wind_direction'].flatten[i]
          segment[:speed] = @data['wind_speed'].flatten[i]
          segment[:datestamp] = stamp
          segment.merge!(spot_meta)

          @full_report.push(segment)
        end

      end

    end
  end
end
