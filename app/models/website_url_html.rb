require 'nokogiri'
require 'open-uri'

class WebsiteUrlHtml < ApplicationRecord
  belongs_to :website
  belongs_to :website_url_function
  belongs_to :category, optional: true
  belongs_to :scraper_html
  
  def generate_query_string(page)
    '?' + {self.website.query_string_key_page => page}.to_query
  end
  
  def generate_url(page)
    @query_string = generate_query_string(page)
    self.website.url + self.url_extension + @query_string
  end

  def scrape(page)
    url = generate_url(page)
    Rails.cache.fetch(url, expires_in: 10.minutes) do
      html = Nokogiri::HTML(open(url))
      self.scraper_html.scrape(html, self.website.url)
    end
  end
end