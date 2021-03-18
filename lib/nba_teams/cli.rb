class NbaTeams::CLI 
  
  def call 
    intro 
    scrape_teams
    list_teams
    select_team
    
  end
  
  def intro 
    current_year = Time.now.year
    puts "Welcome to #{current_year}'s NBA Roster"
    puts "Here is the teams in the NBA"
    puts "Which team's roster would you to browse? "
  end
  
  def scrape_teams
    @teams = ["Hawks", "Knicks", "Hornets"]
  end
  
  def list_teams
    @teams.each.with_index(1) do |team, index|
      puts "#{index}. #{team}"
    end
    puts "Please input the number for the team you want to view."
  end
  
  def select_team 
    input = gets.strip.to_i
    if valid_input(input, @teams)
      list_roster
    else
      puts "Please input a number from 1 to #{@teams.size}"
      select_team
    end
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def 
  
 
  
end