# == Schema Information
#
# Table name: website_pages
#
#  id            :integer          not null, primary key
#  url_extension :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  website_id    :integer
#  category_id   :integer
#

require 'nokogiri'
require 'open-uri'

class WebsitePage < ApplicationRecord
  belongs_to :website
  belongs_to :category, optional: true

  def scrape_page(page_number)
    get_scraper.scrape_url(generate_url(page_number))
  end

  def get_scraper
    self.website.scraper
  end

  def generate_url(page_number)
    result =
      GenerateUrl.call(
        {
          website: self.website,
          url_extension: self.url_extension,
          page_number: page_number
        }
      )
    return result.url
  end
end
