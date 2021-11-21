# frozen_string_literal: true

require 'csv'

module Scrubber
  class ExportDataIntoCsv
    class << self
      def process
        CSV.open(name_file, 'w') do |csv|
          csv << array_headers
          data_from_url_results.each { |result| csv << result.values  }
        end
      end
      
      private
      
      def name_file
        'scrubber_data.csv'
      end
      
      def data_from_url_results
        Scrubber::GetData.process
      end
      
      def array_headers
        %w[name price link location date photo_link]
      end
    end
  end
end
