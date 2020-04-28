class ScrapeForGames < Actor
  input :page_to_scrape
  output :games
  def call
    games = []
    page_to_scrape.css(".search_result_row").each do |result|
      game = {
        title: capitalize(result.css(".title").text),
        steam_link: result.first[1],
        steam_release_date: result.css(".search_released").text,
        epic_link: "",
        epic_release_date: "–"
      }
      games << game
    end
    self.games = games
  end

  private 
  def capitalize(title)
    return title.split(/ |\_|\-/).map(&:capitalize).join(" ")
  end
end