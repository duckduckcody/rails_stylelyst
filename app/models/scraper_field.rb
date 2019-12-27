# == Schema Information
#
# Table name: scraper_fields
#
#  id         :integer          not null, primary key
#  name       :string
#  selector   :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  scraper_id :integer
#

class ScraperField < ApplicationRecord
  belongs_to :scraper

  def scrape; end
end
