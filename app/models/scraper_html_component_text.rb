class ScraperHtmlComponentText < ScraperHtmlComponent
    def scrape(html)
        html.css(self.selector).text
    end
end
