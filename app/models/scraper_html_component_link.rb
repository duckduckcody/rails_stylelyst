class ScraperHtmlComponentLink < ScraperHtmlComponent
    belongs_to :scraper_html
    
    def scrape(params)
        params[:base_url] + params[:html].css(self.selector).attr('href')
    end
end
