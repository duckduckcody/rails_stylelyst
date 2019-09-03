# == Schema Information
#
# Table name: scrapers
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  container_selector :string
#

class Scraper < ApplicationRecord
    belongs_to :website
    has_many :scraper_fields
    has_many :scraper_field_texts
    has_many :scraper_field_prices
    has_many :scraper_field_images
    has_many :scraper_field_links
    
    def scrape(html, base_url)
        return html.css(self.container_selector).map { |container|
            Hash[self.scraper_html_components.map { |component| 
                [component.name, component.scrape({:html=>container,:base_url=>base_url})]
            }]
        }
    end
end
