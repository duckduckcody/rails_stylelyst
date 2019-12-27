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

class ScraperFieldLink < ScraperField
  def scrape(params)
    params[:base_url] + params[:html].css(self.selector).attr('href')
  rescue StandardError
    nil
  end
end
