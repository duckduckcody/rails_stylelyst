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
