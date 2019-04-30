class Website < ApplicationRecord
    has_one :scraper
    has_many :website_pages

    def scrape(user_settings, page)
        @page = self.website_pages.find_by(gender: user_settings[:gender_id], category: user_settings[:category_id])
        if !@page.blank?
            self.scraper.scrape(@page['url_extension'] + make_query_string(self.query_string_key_page, page))
        end
    end

    # make a html_service
    # get_html()
    # make_query_string()

    def make_query_string(key, value)
        "?" + key + "=" + value
    end
end