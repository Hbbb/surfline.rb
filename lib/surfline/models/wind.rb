module Surfline
  module Models
    class Wind < Base
      def initialize(data)
        @data = data['Wind'] if data['Wind']

        if @data == nil
          raise 'Invalid Surfline Wind data'
        end
      end

      def report(time)
        {
          direction: direction(time),
          speed: speed(time)
        }
      end

      def direction(time)
        attr('wind_direction')[time_group(time)]
      end

      def speed(time)
        attr('wind_speed')[time_group(time)]
      end

      private

      def time_group(time)
        # FIXME: This may be a bad assumption
        report_hour = time.class == Time ? time.hour : Time.new(time).hour
        segment = nil

        if (2..4).include?(report_hour)
          segment = 0
        elsif (5..7).include?(report_hour)
          segment = 1
        elsif (8..10).include?(report_hour)
          segment = 2
        elsif (11..13).include?(report_hour)
          segment = 3
        elsif (14..16).include?(report_hour)
          segment = 4
        elsif (17..19).include?(report_hour)
          segment = 5
        elsif (20..22).include?(report_hour)
          segment = 6
        else
          segment = 7
        end
      end
    end
  end
end
