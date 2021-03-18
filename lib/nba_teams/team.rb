class NbaTeams::Team 
  attr_accessor :name, :url, :player
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    save
  end
  
  def self.all
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def player 
    self.player.name
  end
  
end