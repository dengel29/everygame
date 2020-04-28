class ScrapeSteam < Actor
  play OpenPage,
      -> (result) { result.page_to_scrape = result.page },
    ScrapeForGames
    #   -> (result) { result.games_to_save = result.games}
    # SaveGames
end