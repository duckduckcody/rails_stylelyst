class ScraperHtml < ApplicationRecord
    belongs_to :website_url_html
    has_many :scraper_html_components
    has_many :scraper_html_component_texts
    has_many :scraper_html_component_prices
    has_many :scraper_html_component_images
    has_many :scraper_html_component_links
    
    def scrape(html)
        html.css(self.container_selector).map { |container|
            Hash[self.scraper_html_components.map { |component| 
                [component.name, component.scrape(container)]
            }]
        }
    end
end
