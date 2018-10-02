module Halo
  module Services
    class UGC < Base
      def player_game_variant(player, variant)
        endpoint = URI("/ugc/h5/players/#{player}/gamevariants/#{variant}")
        process_request(endpoint)
      end

      def player_game_variants(player, options = {})
        endpoint = URI("/ugc/h5/players/#{player}/gamevariants")
        endpoint.query = URI.encode_www_form(options)
        process_request(endpoint)
      end

      def player_map_variant(player, variant)
        endpoint = URI("/ugc/h5/players/#{player}/mapvariants/#{variant}")
        process_request(endpoint)
      end

      def player_map_variants(player, options = {})
        endpoint = URI("/ugc/h5/players/#{player}/mapvariants")
        endpoint.query = URI.encode_www_form(options)
        process_request(endpoint)
      end
    end
  end
end
