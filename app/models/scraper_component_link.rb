class ScraperComponentLink < ScraperComponent
    belongs_to :scraper

    def scrape(html)
        self.scraper.url + html.css(self.selector).attr('href')
    end
end
