class Website < ApplicationRecord
    has_many :website_url_htmls

    # join html and json tables to be searched by gender and category

    def scrape(user_settings, params)
        @website_url = self.website_url_htmls.find_by(gender_id: user_settings[:gender_id], category: user_settings[:category_id])
        @website_url.scrape(params)
    end

    def scrape_search(user_settings, search)
        @url = self.website_url_searches.find_by(gender: nil, category: nil)
        @query_string = HtmlService.to_query({self.query_string_key_search => search})
        self.scraper_search.scrape(@url.url + @query_string)
    end
end