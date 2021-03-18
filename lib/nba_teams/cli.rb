class NbaTeams::CLI 
  
  def call 
    intro 
    list_teams
    get_user_input 
    
  end
  
  def intro 
    current_year = Time.now.year
    puts "Welcome to #{current_year}'s NBA Roster"
    puts "Here is the teams in the NBA"
    puts "Which team's roster would you to browse? "
  end
  
  def list_teams
    @teams = ["Hawks", "Knicks", "Hornets"]
    @teams.each.with_index(1) do |team, index|
      puts "#{index}. #{team}"
    end
  end
  
  def get_user_input 
    
  end
  
 
  
end