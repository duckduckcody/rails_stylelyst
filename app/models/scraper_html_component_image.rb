class ScraperHtmlComponentImage < ScraperHtmlComponent
    def scrape(html)
        html.css(self.selector).css('img').attr('src')
    end
end
