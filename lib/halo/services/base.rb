module Halo
  module Services
    class Base
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def request(endpoint)
        url = URI(client.base_uri) + endpoint
        get_request = Net::HTTP::Get.new(url)
        get_request['Ocp-Apim-Subscription-Key'] = client.api_key
        client.client.request get_request
      end
    end
  end
end
