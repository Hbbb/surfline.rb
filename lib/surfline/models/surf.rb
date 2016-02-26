module Surfline
  module Models
    class Surf < Base
      attr_reader :full_report

      def initialize(data)
        super

        begin
          @data = data['Surf']
        rescue NoMethodError
          raise 'Invalid Surfline Surf Report \n Ensure the API has not changed'
        end

        # Pull out what we need
        # NOTE: This doesn't seem necessary since we're not accessing individual properties
        @data.select! do |key|
          whitelist.include?(key)
        end

        # Build full report
        @full_report = []
        @data['dateStamp'].flatten.each_with_index do |stamp, i|
          segment = {}
          segment[:height_1] = @data['swell_height1'].flatten[i]
          segment[:height_2] = @data['swell_height2'].flatten[i]
          segment[:height_3] = @data['swell_height3'].flatten[i]
          segment[:period_1] = @data['swell_period1'].flatten[i]
          segment[:period_2] = @data['swell_period2'].flatten[i]
          segment[:period_3] = @data['swell_period3'].flatten[i]
          segment[:direction_1] = @data['swell_direction1'].flatten[i]
          segment[:direction_2] = @data['swell_direction2'].flatten[i]
          segment[:direction_3] = @data['swell_direction3'].flatten[i]
          segment[:datestamp] = stamp
          segment[:surf_max] = @data['surf_max'].flatten[i]
          segment[:surf_min] = @data['surf_min'].flatten[i]
          segment.merge!(spot_meta)

          @full_report.push(segment)
        end

      end

      private

      def whitelist
        %w(dateStamp swell_height1 swell_height2 swell_height3 swell_period1 swell_period2 swell_period3 swell_direction1 swell_direction2 swell_direction3 surf_max surf_min)
      end

    end
  end
end
