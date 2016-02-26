module Surfline
  module Models
    class Analysis < Base
      def initialize(data)
        super

        begin
          @data = data['Analysis']
        rescue NoMethodError
          raise 'Invalid Analysis report \n Ensure the API has not changed'
        end
      end

      def report_text
        attr 'surfRange'
      end

      def surf_max
        attr 'surfMax'
      end

      def surf_peak
        attr 'surfPeak'
      end

      def surf_min
        attr 'surfMin'
      end

      def short_term_forecast
        attr 'short_term_forecast'
      end

      def condition
        attr 'generalCondition'
      end

      def standout
        attr 'occasional'
      end

      def report_date
        attr 'reportdate'
      end

      def full_report
        {
          report_text: report_text,
          surf_max: surf_max,
          surf_min: surf_min,
          surf_peak: surf_peak,
          short_term_forecast: short_term_forecast,
          condition: condition,
          standout: standout,
          datestamp: report_date,
        }.merge!(spot_meta)
      end

      def data
        @data
      end
    end
  end
end
