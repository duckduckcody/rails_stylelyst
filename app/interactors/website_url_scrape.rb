class WebsiteUrlScrape
  include Interactor

  def call
    url = generate_url(context.page)
    context.result = Rails.cache.fetch(url, expires_in: 10.minutes) do
      html = Nokogiri::HTML(open(url))
      context.website_url.scraper_html.scrape(html, context.website_url.website.url)
    end
  end

  def generate_query_string(page)
    '?' + {context.website_url.website.query_string_key_page => page}.to_query
  end
  
  def generate_url(page)
    query_string = generate_query_string(page)
    context.website_url.website.url + context.website_url.url_extension + query_string
  end
end
