class WebsiteUrlScrape
  include Interactor

  # scrape a website's url based on 
  def call
    url = context.url
    website_url = context.website_url
    base_url = website_url.website.url
    context.scraped_content = Rails.cache.fetch(url, expires_in: 10.minutes) do
      html = Nokogiri::HTML(open(url))
      website_url.scraper_html.scrape(html, base_url)
    end
  end
end
