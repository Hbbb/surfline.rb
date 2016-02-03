module Surfline
  module Models
    class Analysis < Base
      def initialize(data)
        @data = data['Analysis']
        if @data == nil
          raise 'Invalid Surfline Analysis response'
        end
      end

      def report_text
        attr 'surfRange'
      end

      def surf_max
        attr 'surfMax'
      end

      def surf_min
        attr 'surfMin'
      end

      def condition
        attr 'generalCondition'
      end

      def report_date
        attr 'reportdate'
      end

      def report_time
        attr 'report_time'
      end

      def data
        @data
      end
    end
  end
end
