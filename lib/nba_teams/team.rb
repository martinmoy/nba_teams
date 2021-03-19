class NbaTeams::Team 
  attr_accessor :name, :url, :player
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @player = []
    save
  end
  
  def self.all
    NbaTeams::Scraper.scrape_teams if @@all.empty?
    @@all
  end
  
  def save 
    @@all << self
  end

  def get_player
    NbaTeams::Scraper.scrape_player(self) if @player.empty?
  end


end