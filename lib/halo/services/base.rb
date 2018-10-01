require 'json'

module Halo
  module Services
    class Base
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def build_request(endpoint)
        url = URI(client.base_uri + endpoint)
        request = Net::HTTP::Get.new(url)
        request['Ocp-Apim-Subscription-Key'] = client.api_key
        request
      end

      def process_request(endpoint)
        request = build_request(endpoint)
        response = client.client.request request
        JSON.parse(response)
      end

    end
  end
end
