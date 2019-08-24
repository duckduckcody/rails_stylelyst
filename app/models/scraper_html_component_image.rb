# == Schema Information
#
# Table name: scraper_html_components
#
#  id              :integer          not null, primary key
#  name            :string
#  selector        :string
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scraper_html_id :integer
#

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
