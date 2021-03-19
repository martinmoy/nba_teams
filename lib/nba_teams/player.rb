class NbaTeams::Player
  attr_accessor :name, :team, :stats, :url 
  
  @@all = []
  
  def initialize(name, team, url)
    @name = name
    @team = team
    @url = url
    add_to_team
    save
  end
  
  def self.all 
    @@all
  end

  def save 
    @@all << self
  end

  def add_to_team
    @team.player << self unless @team.player.include?(self)
  end

  def point
  end

  def rebound 
  end
  
  def assist
  end

  def weight
  end

  def height
  end

  def age
  end
  
end