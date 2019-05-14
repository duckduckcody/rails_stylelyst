class ScraperHtmlComponentLink < ScraperHtmlComponent
    belongs_to :scraper_html
    
    def scrape(params)
        begin
            params[:base_url] + params[:html].css(self.selector).attr('href')
        rescue
            nil
        end
    end
end
