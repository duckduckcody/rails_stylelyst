class ScraperHtmlComponentText < ScraperHtmlComponent
    def scrape(params)
        begin
            params[:html].css(self.selector).text
        rescue
            nil
        end
    end
end
