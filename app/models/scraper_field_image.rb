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

class ScraperFieldImage < ScraperField
  def scrape(params)
    @image = params[:html].css(self.selector).css('img').attr('src')
    if @image.nil?
      @image = params[:html].css(self.selector).css('img').attr('data-src')
    end
    begin
      @image.value
    rescue StandardError
      nil
    end
  end
end
