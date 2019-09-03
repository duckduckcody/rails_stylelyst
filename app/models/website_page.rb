
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
end
