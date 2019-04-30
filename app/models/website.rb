class Website < ApplicationRecord
    has_one :scraper
    has_many :website_pages

    def scrape(user_settings)
        @page = self.website_pages.find_by(gender: user_settings[:gender_id], category: user_settings[:category_id])
        if !@page.blank?
            self.scraper.scrape(@page['url_extension'])
        end
    end
end
