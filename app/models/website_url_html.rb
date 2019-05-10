require 'nokogiri'
require 'open-uri'

class WebsiteUrlHtml < ApplicationRecord
  belongs_to :website
  belongs_to :website_url_function
  belongs_to :category, optional: true
  belongs_to :scraper_html
  
  def generate_query_string(params)
    '?' + {self.website.query_string_key_page => params[:page]}.to_query
  end
  
  def generate_url(params)
    @query_string = generate_query_string(params)
    self.website.url + self.url_extension + @query_string
  end

  def scrape(params)
    @html = Nokogiri::HTML(open(generate_url(params)))
    self.scraper_html.scrape(@html, self.website.url)
  end
end
