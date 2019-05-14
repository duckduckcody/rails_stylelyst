class ScraperHtmlComponentImage < ScraperHtmlComponent
    def scrape(params)
        @image = params[:html].css(self.selector).css('img').attr('src')
        if @image.nil?
            @image = params[:html].css(self.selector).css('img').attr('data-src')
        end
        begin
            @image.value
        rescue
            nil
        end
    end
end
