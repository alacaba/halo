module Halo
  module Services
    class Profile < Base
      def appearance(gt)
        endpoint = URI("/profile/h5/profiles/#{gt}/appearance")
        process_request(endpoint)
      end

      def emblem(gt, query = {})
        endpoint = URI("/profile/h5/profiles/#{gt}/emblem")
        endpoint.query = URI.encode_www_form(query)
        process_request(endpoint)
      end

      def spartan(gt, query = {})
        endpoint = URI("/profile/h5/profiles/#{gt}/spartan")
        endpoint.query = URI.encode_www_form(query)
        process(request_endpoint)
      end
    end
  end
end
