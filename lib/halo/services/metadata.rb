module Halo
  module Services
    class Metadata < Base
      def campaign_missions
        endpoint = URI('/metadata/h5/metadata/campaign-missions')
        process_request(endpoint)
      end

      def commendations
        endpoint = URI('/metadata/h5/metadata/commendations')
        process_request(endpoint)
      end

      def company_commendations
        endpoint = URI('/metadata/h5/metadata/company-commendations')
        process_request(endpoint)
      end

      def csr_designations
        endpoint = URI('/metadata/h5/metadata/csr-designations')
        process_request(endpoint)
      end

      def enemies
        endpoint = URI('/metadata/h5/metadata/enemies')
        process_request(endpoint)
      end

      def flexible_stats
        endpoint = URI('/metadata/h5/metadata/flexible-stats')
        process_request(endpoint)
      end

      def game_base_variants
        endpoint = URI('/metadata/h5/metadata/flexible-stats')
        process_request(endpoint)
      end

      def game_variants(id)
        endpoint = URI("/metadata/h5/metadata/game-variants/#{id}")
        process_request(endpoint)
      end

      def impulses
        endpoint = URI('/metadata/h5/metadata/impulses')
        process_request(endpoint)
      end

      def map_variant(id)
        endpoint = URI("/metadata/h5/metadata/map-variants/#{id}")
        process_request(endpoint)
      end

      def maps
        endpoint = URI('/metadata/h5/metadata/maps')
        process_request(endpoint)
      end

      def medals
        endpoint = URI('/metadata/h5/metadata/medals')
        process_request(endpoint)
      end

      def playlists
        endpoint = URI('/metadata/h5/metadata/playlists')
        process_request(endpoint)
      end

      def requisition(id)
        endpoint = URI("/metadata/h5/metadata/requisitions/#{id}")
        process_request(endpoint)
      end

      def requisition_pack(id)
        endpoint = URI("/metadata/h5/metadata/requisition-packs/#{id}")
        process_request(endpoint)
      end

      def seasons
        endpoint = URI('/metadata/h5/metadata/seasons')
        process_request(endpoint)
      end

      def skull
        endpoint = URI('/metadata/h5/metadata/skulls')
        process_request(endpoint)
      end

      def spartan_ranks
        endpoint = URI('/metadata/h5/metadata/spartan-ranks')
        process_request(endpoint)
      end

      def team_colors
        endpoint = URI('/metadata/h5/metadata/team-colors')
        process_request(endpoint)
      end

      def vehicles
        endpoint = URI('/metadata/h5/metadata/vehicles')
        process_request(endpoint)
      end

      def weapons
        endpoint = URI('/metadata/h5/metadata/weapons')
        process_request(endpoint)
      end

      # halo wars

      %w([ campaign_levels campaign_logs card_keywords cards
           csr_designations difficulties game_object_categories
           game_objects leader_powers leaders maps packs
           playlists seasons spartan-ranks techs
        ]).each do |method_name|
        define_method method_name.to_sym do |start_at|
          start_at ||= nil
          endpoint = __method__.to_s.sub('_', '-')
          process_hw2(endpoint, start_at)
        end
      end

      def process_hw2(ep, start_at)
        endpoint = URI("/metadata/hw2/endpoint/#{ep}")
        endpoint.query = URI.encode_www_form('startAt' => start_at) if start_at
        process_request(endpoint)
      end
    end
  end
end
