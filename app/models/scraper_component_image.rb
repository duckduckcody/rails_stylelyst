class ScraperComponentImage < ScraperComponent
    def scrape(html)
        html.css(self.selector).css('img').attr('src')
    end
end
