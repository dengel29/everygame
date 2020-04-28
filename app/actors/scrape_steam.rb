class ScrapeSteam < Actor
  play OpenPage,
      -> (result) { result.page_to_scrape = result.page },
    ScrapeForGames
    
end