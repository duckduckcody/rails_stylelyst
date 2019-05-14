class ScraperHtmlComponentPrice < ScraperHtmlComponent
    def scrape(params)
        begin
            params[:html].css(self.selector).text.tr('$','').to_f
        rescue
            nil
        end
    end
end
