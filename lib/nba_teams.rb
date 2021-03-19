require_relative "nba_teams/version"
require_relative 'nba_teams/cli.rb'
require_relative 'nba_teams/team.rb'
require_relative 'nba_teams/scraper.rb'
require_relative 'nba_teams/player.rb'

require 'pry'
require 'nokogiri'
require 'open-uri'

module NbaTeams
  class Error < StandardError; end
  # Your code goes here...
end
