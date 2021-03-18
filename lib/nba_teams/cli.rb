class NbaTeams::CLI 
  
  def call 
    intro 
    list_teams
    select_team
    select_player
    goodbye
  end
  
  def intro 
    current_year = Time.now.year
    puts "Welcome to #{current_year}'s NBA Roster"
    puts "Here is the teams in the NBA"
    puts "Which team's roster would you to browse? "
    scrape_teams
  end
  
  def scrape_teams
    @teams = ["Hawks", "Knicks", "Hornets"]
  end
  
  def list_teams
    puts " "
    @teams.each.with_index(1) do |team, index|
      puts "#{index}. #{team}"
    end
    puts "Please input the number for the team you want to view."
  end
  
  def select_team 
    input = gets.strip.to_i
    if valid_input(input, @teams)
      scrape_roster
      list_roster
    else
      puts "Please input a number from 1 to #{@teams.size}"
      select_team
    end
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def scrape_roster
    @roster = ["WADE", "Kobe", "Lebron", "Hello Kitty"]
  end
  
  def list_roster
    puts " "
    puts " "
    @roster.each.with_index(1) do |player, index|
      puts "#{index}. #{player}"
    end
    puts " "
    puts "Please input the number for the player you want to view."
  end
  
  def select_player
    input = gets.strip.to_i
    if valid_input(input, @roster)
      scrape_stats
      list_stats
    else
      puts "Please input a number from 1 to #{@roster.size}"
      select_player
    end
  end
  
  def scrape_stats
    @stat = ["chicken", " game"]
  end
  
  def list_stats
    @stat.each.with_index(1) do |stats, index|
      puts "#{index}. #{stats}"
    end
  end
  
  def goodbye
    puts " "
    puts "see you later"
  end
  
end