require 'nokogiri'
require 'open-uri'

class WebsiteUrlHtml < ApplicationRecord
  has_one :scraper_html
  belongs_to :website
  belongs_to :gender, optional: true
  belongs_to :category, optional: true
  
  def generate_query_string(params)
    '?' + {self.website.query_string_key_page => params[:page]}.to_query
  end
  
  def generate_url(params)
    @query_string = generate_query_string(params)
    self.website.url + self.url_extension + @query_string
  end

  def scrape(params)
    @html = Nokogiri::HTML(open(generate_url(params)))
    self.scraper_html.scrape(@html)
  end
end
