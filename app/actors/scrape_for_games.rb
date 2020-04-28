class ScrapeForGames < Actor
  input :page_to_scrape
  output :games
  def call
    games = []
    page_to_scrape.css(".search_result_row").each do |result|
      game = {
        title: capitalize(result.css(".title").text),
        steam_link: result.first[1],
        steam_release_date: result.css(".search_released").text
      }
      game_page = Nokogiri::HTML(open(game[:steam_link]))
      game[:steam_description] = game_page.css(".game_description_snippet").text.strip
      game[:tags] = game_page.css(".app_tag").map { |tag| tag.text.strip}
      games << game
    end


    self.games = games
  end

  private 

  def capitalize(title)
    return title.split(/ |\_|\-/).map(&:capitalize).join(" ")
  end

  def save_game_or_exit(game)

  end
end