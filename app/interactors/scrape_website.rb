class ScrapeWebsite
  include Interactor::Organizer
  
  organize FindWebsiteUrl, GenerateUrl, WebsitePageScrape
end
