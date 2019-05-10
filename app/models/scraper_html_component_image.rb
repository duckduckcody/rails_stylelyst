class ScraperHtmlComponentImage < ScraperHtmlComponent
    def scrape(params)
        @image = params[:html].css(self.selector).css('img').attr('src')
        if @image.nil?
            return params[:html].css(self.selector).css('img').attr('data-src')
        end
        @image
    end
end
