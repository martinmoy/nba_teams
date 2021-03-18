require_relative "nba_teams/version"
require_relative 'nba_teams/cli'
require_relative 'nba_teams/team'
require_relative 'nba_teams/scraper'
require_relative 'nba_teams/player'

require 'pry'
require 'nokogiri'
require 'open-uri'

module NbaTeams
  class Error < StandardError; end
  # Your code goes here...
end
