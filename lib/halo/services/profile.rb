module Halo
  module Services
    class Profile < Base
      def appearance(gt)
        endpoint = URI("/profile/h5/profiles/#{gt}/appearance")
        ::Response.result(request(endpoint))
      end

      def emblem(gt, size=128)
        endpoint = URI("/profile/h5/profiles/#{gt}/emblem?size=#{size}")
        ::Response.result(request(endpoint))
      end

      def spartan(gt, size = 128, crop = 'portrait')
        endpoint = URI("/profile/h5/profiles/#{gt}/spartan?size=#{size}&crop=#{crop}")
        ::Response.result(request(endpoint))
      end
    end
  end
end
