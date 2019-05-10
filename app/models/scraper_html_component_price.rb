class ScraperHtmlComponentPrice < ScraperHtmlComponent
    def scrape(params)
        params[:html].css(self.selector).text.tr('$','').to_f
    end
end
