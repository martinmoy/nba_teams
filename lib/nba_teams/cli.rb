require 'pry'
class NbaTeams::CLI 
  
  def call 
    intro   
    cycle
  end
  
  def intro 
    current_year = Time.now.year
    puts "Welcome to #{current_year}'s NBA Roster"
    puts "Here is the teams in the NBA"
    puts "Which team's roster would you like to browse? "
    scrape_teams
  end
  
  def scrape_teams
    @teams = NbaTeams::Team.all
  end
  
  def cycle
    list_teams
    select_team
    select_player
  end
  
  def list_teams
    puts
    @teams.each.with_index(1) do |team, index|
      puts "#{index}. #{team.name}"
    end
    puts "Please input the number for the team you want to view."
  end
  
  def select_team 
    input = gets.strip.to_i
    if valid_input(input, @teams)
      list_roster(input)
    else
      puts "Please input a number from 1 to #{@teams.size}"
      select_team
    end
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def list_roster(input)
    @team_select = @teams[input-1]
    @team_select.get_player
    puts
    puts
    # added this line to remove duplicates
    @roster = @team_select.player.uniq{|t| t.name}
    puts "Team : #{@team_select.name}"
    puts
    @roster.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end
    puts
    puts "Please input the number for the player you want to view."
    select_player
  end
  
  def select_player
    input = gets.strip.to_i
    if valid_input(input, @roster)
      open_url(input)
    else
      puts "Please input a number from 1 to #{@roster.size}"
    end
  end
  
  def goodbye
    puts
    puts "See You Later"
    exit
  end

  def open_url(input)
    `open "#{@roster[input-1].url}"`
    puts
    puts
    puts "Type 'team' to see the list of all nba teams again."
    puts "Type 'exit' to end the program."
    menu
  end

  def menu
    input = gets.strip.downcase
    if input == "team" 
      cycle
    elsif input == "exit"
      goodbye
    else
      puts
      puts "I don't understand that answer."
      puts "Type 'team' to see the list of all nba teams again."
      puts "Type 'exit' to end the program."
      menu
    end
  end

end