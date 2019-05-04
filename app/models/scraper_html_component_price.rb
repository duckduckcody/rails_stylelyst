class ScraperHtmlComponentPrice < ScraperHtmlComponent
    def scrape(html)
        html.css(self.selector).text.tr('$','').to_f
    end
end
