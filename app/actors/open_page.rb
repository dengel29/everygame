require 'open-uri'
class OpenPage < Actor
  output :page
  def call
    self.page = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&ignore_preferences=1&category1=998&page=1"))
  end
end