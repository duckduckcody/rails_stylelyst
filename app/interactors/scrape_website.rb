class ScrapeWebsite
  include Interactor::Organizer
  
  organize FindWebsiteUrl, GenerateUrl, WebsiteUrlScrape
end
