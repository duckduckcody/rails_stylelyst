class ScraperHtmlComponentText < ScraperHtmlComponent
    def scrape(params)
        params[:html].css(self.selector).text
    end
end
