require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord
    belongs_to :website
    has_many :scraper_components
    has_many :scraper_component_texts
    has_many :scraper_component_prices
    has_many :scraper_component_images
    has_many :scraper_component_links

    def url
        self.website.url
    end

    def get_html(url_extension)
        Nokogiri::HTML(open(self.url + url_extension))
    end

    def scrape(url_extension)
        page = get_html(url_extension)
        page.css(self.container_selector).map { |container|
            Hash[self.scraper_components.map { |component| 
                [component.name, component.scrape(container)]
            }]
        }
    end
end
