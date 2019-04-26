class ScraperComponent < ApplicationRecord
    belongs_to :scraper
    
    def scrape
        puts "Scrape method is not set"
    end
end
