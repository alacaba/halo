module Halo
  module Services
    class Stats < Base
      def company(company_id)
        endpoint = URI("/stats/h5/companies/#{company_id}")
        process_request(endpoint)
      end

      def company_commendations(company_id)
        endpoint = URI("/stats/h5/companies/#{company_id}/commendations")
        process_request(endpoint)
      end

      def leaderboard(season_id, playlist_id, options = {})
        endpoint = URI("/stats/h5/player-leaderboards/csr/#{season_id}/#{playlist_id}")
        endpoint.query = URI.encode_www_form(options)
        process_request(endpoint)
      end

      # match results

      def match_events(match_id)
        endpoint = URI("/stats/h5/matches/#{match_id}/events")
        process_request(endpoint)
      end

      def match_result_arena(match_id)
        match_result('arena', match_id)
      end

      def match_result_campaign(match_id)
        match_result('campaign', match_id)
      end

      def match_result_custom(match_id)
        match_result('custom', match_id)
      end

      def match_result_custom_local(match_id)
        match_result('customlocal', match_id)
      end

      def match_result_warzone(match_id)
        match_result('warzone', match_id)
      end

      def match_result(match_type, match_id)
        endpoint = URI("/stats/h5/#{match_type}/matches/#{match_id}")
        process_request(endpoint)
      end

      def player_commendations(gt)
        endpoint = URI("/stats/h5/players/#{gt}/commendations")
        process_request(endpoint)
      end

      def player_matches(gt, modes = {})
        endpoint = URI("/stats/h5/players/#{gt}/matches")
        endpoint.query = URI.encode_www_form(modes)
        process_request(endpoint)
      end

      # service records

      def service_record_arena(players, season_id = nil)
        service_records('arena', players, season_id)
      end

      def service_record_campaign(players)
        service_records('campaign', players)
      end

      def service_record_custom(players)
        service_records('custom', players)
      end

      def service_record_custom_local(players)
        service_records('custom_local', players)
      end

      def service_record_warzone(players)
        service_records('warzone', players)
      end

      def service_records(match_type, players = [], season_id = nil)
        endpoint = URI("/stats/h5/servicerecords/#{match_type}")
        q = {}
        q[:players] = players.join(',')
        q[:season_id] = season_id if season_id
        endpoint.query = URI.encode_www_form(q)
        process_request(endpoint)
      end

      # pc matches

      def pc_match_results(match_id)
        endpoint = URI("/stats/h5pc/custom/matches/#{match_id}")
        process_request(endpoint)
      end

      def pc_player_match_history(player, options = {})
        endpoint = URI("/stats/h5pc/players/#{player}/matches")
        endpoint.query = URI.encode_www_form(options)
        process_request(endpoint)
      end

      def pc_service_record_custom(players)
        endpoint = "/stats/h5pc/servicerecords/custom?players=#{players.join(',')}"
        process_request(endpoint)
      end

      # halo wars 2

      def halo_wars_leaderboard(season_id, playlist_id, count)
        endpoint = URI("/stats/hw2/player-leaderboards/csr/#{season_id}/#{playlist_id}")
        endpoint.query = URI.encode_www_form({ "count" => count })
        process_request(endpoint)
      end

      def halo_wars_match_event(match_id)
        endpoint = URI("/stats/hw2/matches/#{match_id}/events")
        process_request(endpoint)
      end

      def halo_wars_match_result(match_id)
        endpoint = URI("/stats/hw2/matches/#{match_id}")
        process_request(endpoint)
      end

      def halo_wars_campaign_progress(player)
        endpoint = URI("/stats/hw2/players/#{player}/campaign-progress")
        process_request(endpoint)
      end

      def halo_wars_match_history(player, options = {})
        endpoint = URI("/stats/hw2/players/#{player}/matches")
        endpoint.query = URI.encode_www_form(options)
        process_request(endpoint)
      end

      def halo_wars_player_ratings(playlist_id, players)
        endpoint = URI("/stats/hw2/playlist/#{playlist_id}/rating?players=#{players.join(',')}")
        process_request(endpoint)
      end

      def halo_wars_season_stats_summary(player, season_id)
        endpoint = URI("/stats/hw2/players/#{player}/stats/seasons/#{season_id}")
        process_request(endpoint)
      end

      def halo_wars_stats_summary(player)
        endpoint = URI("/stats/hw2/players/#{player}/stats")
        process_request(endpoint)
      end

      def halo_wars_player_xps(players)
        endpoint = URI("/stats/hw2/xp?players=#{players.join(',')}")
        process_request(endpoint)
      end
    end
  end
end
