module Surfline
  module Models
    class Surf < Base
      def initialize(data)
        @data = data['Surf']['spot'] if data['Surf']

        if @data == nil
          raise 'Invalid Surfline Surf data'
        end
      end

      def swell_report(group, time)
        {
          height: height(group, time),
          direction: direction(group, time),
          period: period(group, time)
        }
      end

      def full_swell_report(time)
        [
          swell_report(1, time),
          swell_report(2, time),
          swell_report(3, time)
        ]
      end

      def height(group, time)
        result = attr("swell_height#{group}")
        result[time_group(time)] if time
      end

      def direction(group, time)
        result = attr("swell_direction#{group}")
        result[time_group(time)] if time
      end

      def period(group, time)
        result = attr("swell_period#{group}")
        result[time_group(time)] if time
      end

      private

      def time_group(time)
        # FIXME: This may be a bad assumption
        report_hour = time.class == Time ? time.hour : Time.new(time).hour
        segment = nil

        if (5..10).include?(report_hour)
          segment = 0
        elsif (11..16).include?(report_hour)
          segment = 1
        elsif (17..22).include?(report_hour)
          segment = 2
        else
          segment = 3
        end
      end

    end
  end
end
