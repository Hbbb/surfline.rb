module Surfline
  module Models
    class Base
      private
      # Surfline's API divides all swell resources into four groups
      # The groups represent four sections of the day (5am, 11am, 5pm, 11pm)
      # Given a time, return which group it falls within
      def segment_time(time)
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

