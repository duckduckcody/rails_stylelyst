class WebsitePageScrape
  include Interactor

  # scrape a website's url based on 
  def call
    url = context.url
    website = context.website
    print 'website.scraper'
    print website.scraper.scrape
    context.scraped_content = Rails.cache.fetch(url, expires_in: 10.minutes) do
      html = Nokogiri::HTML(open(url))
      website.scraper.scrape(html, website.url)
    end
  end
end
