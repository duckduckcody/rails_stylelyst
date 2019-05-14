class ScraperHtml < ApplicationRecord
    has_many :website_url_htmls
    has_many :scraper_html_components
    has_many :scraper_html_component_texts
    has_many :scraper_html_component_prices
    has_many :scraper_html_component_images
    has_many :scraper_html_component_links
    
    def scrape(html, base_url)
        return html.css(self.container_selector).map { |container|
            Hash[self.scraper_html_components.map { |component| 
                [component.name, component.scrape({:html=>container,:base_url=>base_url})]
            }]
        }
    end
end
