class Website < ApplicationRecord
    has_many :website_url_htmls

    def scrape(category, page, url_function)
        self.website_url_htmls
            .find_by(
                category: category,
                website_url_function: url_function
            )
            .scrape(page)
    end
end