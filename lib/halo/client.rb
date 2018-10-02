require 'net/http'
require 'json'
require 'halo/services/base'
require 'halo/services/profile'
require 'halo/services/stats'
require 'halo/services/metadata'

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

    def stats
      Halo::Services::Stats.new(self)
    end

    def metadata
      Halo::Services::Metadata.new(self)
    end
  end
end
