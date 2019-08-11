require 'nokogiri'
require 'open-uri'

class WebsiteUrlHtml < ApplicationRecord
  belongs_to :website
  belongs_to :website_url_function
  belongs_to :category, optional: true
  belongs_to :scraper_html
end