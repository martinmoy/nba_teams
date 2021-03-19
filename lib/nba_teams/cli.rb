require 'pry'
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
    @teams = NbaTeams::Team.all
  end
  
  def list_teams
    puts " "
    @teams.each.with_index(1) do |team, index|
      puts "#{index}. #{team.name}"
    end
    puts "Please input the number for the team you want to view."
  end
  
  def select_team 
    selected_team = gets.strip.to_i
    if valid_input(selected_team, @teams)
      list_roster(selected_team)
    else
      puts "Please input a number from 1 to #{@teams.size}"
      select_team
    end
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  
  def list_roster(selected_team)
    team_select = @teams[selected_team-1]
    team_select.get_player
    puts " "
    puts " "
    # added this line to remove duplicates
    @roster = team_select.player.uniq{|t| t.name}
    @roster.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
      puts "#{player.team.name}"
      puts "#{player.url}"
    end
    puts " "
    puts "Please input the number for the player you want to view."
    select_player
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