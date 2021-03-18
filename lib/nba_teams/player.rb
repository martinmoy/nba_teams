class NbaTeams::Player
  attr_accessor :name, :team, :stats, :url 
  
  @@all = []
  
  def initialize(name, team, url)
    @name = name
    @team = team
    @url = url
  end
  
  def self.all 
    @@all
  end
  
  def team 
    self.team 
  end 
end