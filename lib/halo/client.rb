require 'net/http'
require 'halo/services/base'
require 'halo/services/profile'

module Halo
  class Client
    attr_accessor :api_key, :base_uri

    def initialize(options = {})
      @api_key  = options.fetch(:api_key, ENV['API_KEY'])
      @base_uri = options.fetch(:base_uri, ENV['BASE_URI'])
    end

    def client
      uri          = URI(base_uri)
      http         = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http
    end

    def profile
      Halo::Services::Profile.new(self)
    end

  end
end
