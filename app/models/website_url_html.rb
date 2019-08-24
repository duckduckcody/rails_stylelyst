# == Schema Information
#
# Table name: website_url_htmls
#
#  id                      :integer          not null, primary key
#  url_extension           :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  website_id              :integer
#  category_id             :integer
#  website_url_function_id :integer
#  scraper_html_id         :integer
#

require 'nokogiri'
require 'open-uri'

class WebsiteUrlHtml < ApplicationRecord
  belongs_to :website
  belongs_to :website_url_function
  belongs_to :category, optional: true
  belongs_to :scraper_html
end
