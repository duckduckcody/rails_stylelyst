class Website < ApplicationRecord
    has_many :website_url_htmls

    def scrape(user_settings, params, url_function)
        @website_url = self.website_url_htmls.find_by(
            gender_id: user_settings[:gender_id], 
            category: user_settings[:category_id],
            website_url_function: url_function
        )
        @website_url.scrape(params)
    end
end