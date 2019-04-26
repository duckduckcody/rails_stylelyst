class ScraperComponentText < ScraperComponent
    def scrape(html)
        html.css(self.selector).text
    end
end
