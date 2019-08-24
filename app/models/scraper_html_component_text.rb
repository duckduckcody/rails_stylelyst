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

class ScraperHtmlComponentText < ScraperHtmlComponent
    def scrape(params)
        begin
            params[:html].css(self.selector).text
        rescue
            nil
        end
    end
end
