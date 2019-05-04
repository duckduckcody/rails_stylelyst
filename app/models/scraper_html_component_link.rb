class ScraperHtmlComponentLink < ScraperHtmlComponent
    def scrape(html)
        html.css(self.selector).attr('href')
    end
end
