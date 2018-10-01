module Halo
  module Services
    class Profile < Base
      def appearance(gt)
        endpoint = "/profile/h5/profiles/#{gt}/appearance"
        client.client.request(build_request(endpoint))
      end

      def emblem(gt, query = {})
        endpoint = "/profile/h5/profiles/#{gt}/emblem"
        endpoint.query = URI.encode_www_form(query)
        client.client.request(build_request(endpoint))
      end

      def spartan(gt, query = {})
        endpoint = "/profile/h5/profiles/#{gt}/spartan"
        endpoint.query = URI.encode_www_form(query)
        client.client.request(build_request(endpoint))
      end
    end
  end
end
