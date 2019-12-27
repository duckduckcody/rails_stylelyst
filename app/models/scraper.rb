# == Schema Information
#
# Table name: scrapers
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  container_selector :string
#  website_id         :integer

class Scraper < ApplicationRecord
  belongs_to :website
  has_many :scraper_fields
  has_many :scraper_field_texts
  has_many :scraper_field_prices
  has_many :scraper_field_images
  has_many :scraper_field_links

  def scrape_url(url)
    html = get_html(url)
    scrape(html)
  end

  def get_html(url)
    GetHtml.call(
      { url: url, emulate_browser_get: self.website.emulate_browser_get }
    )
      .html
  end

  def scrape(html)
    return(
      html.css(self.container_selector).map do |container|
        Hash[
          self.scraper_fields.map do |component|
            [
              component.name,
              component.scrape({ html: container, base_url: self.website.url })
            ]
          end
        ]
      end
    )
  end
end
