# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'csv'

module Scrubber
  class GetData
    class << self
      def process
        return '' unless url.present?

        get_array_data_from_url
      end

      private

      def get_array_data_from_url
        results = []

        doc.css('.offer-wrapper').each do |flat|
          results.push({
            name: get_name_result(flat),
            price: get_price_result(flat),
            link: get_link_result(flat),
            location: get_location_result(flat),
            date: get_date_result(flat),
            photo_link: get_photo_link_result(flat)
          })
        end

        results
      end

      def url
        "https://www.olx.ua/uk/nedvizhimost/kvartiry/chernovtsy/"
      end

      def html
        open(url)
      end

      def doc
        Nokogiri::HTML(html)
      end

      ##
      # Methods for getting data from webpage:
      #
      def get_name_result(data)
        data.css('.title-cell a strong').text
      end

      def get_price_result(data)
        data.css('.wwnormal .space .price strong').text
      end

      def get_link_result(data)
        data.css('.title-cell a').first['href']
      end

      def get_location_result(data)
        data.css('.bottom-cell div p small span').children[1].text
      end

      def get_date_result(data)
        data.css('.bottom-cell div p small span').children.last.text
      end

      def get_photo_link_result(data)
        data.css('.photo-cell a img').first['src']
      end
    end
  end
end
