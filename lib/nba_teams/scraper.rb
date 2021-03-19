class NbaTeams::Scraper
   
    def self.scrape_teams
        doc = Nokogiri::HTML(open("https://www.lineups.com/nba/rosters"))
        doc.css(".team-txt").each do |team|
            name = team.text.strip
            link = team.attribute("href").value
            NbaTeams::Team.new(name, link)
        end
    end

    def self.scrape_player(team)
        url = "https://www.lineups.com#{team.url}"
        doc = Nokogiri::HTML(open(url))
        doc.css(".link-black-underline").each do |player|
          name = player.css(".player-name-col-lg").text.strip
          url = "https://www.lineups.com#{player.attribute("href").value}"
          NbaTeams::Player.new(name, team, url)
        end 
    end

    
end