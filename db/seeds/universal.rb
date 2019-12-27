universal_scraper = ScraperHtml.new(container_selector: 'li.item')
universal_scraper.scraper_html_component_texts.new(
  name: 'name', selector: 'h2.product-name'
)
# universal_scraper.scraper_html_component_texts.new(name: 'sizzle_text', selector: 'div.product-promo-block')
# universal_scraper.scraper_html_component_texts.new(name: 'brand', selector: 'p.product-card__vendor')
universal_scraper.scraper_html_component_prices.new(
  name: 'price', selector: 'span.regular-price'
)
universal_scraper.scraper_html_component_prices.new(
  name: 'old-price', selector: 'p.old-price'
)
universal_scraper.scraper_html_component_images.new(
  name: 'image', selector: 'a.product-image'
)
universal_scraper.scraper_html_component_links.new(
  name: 'link', selector: 'a.product-image'
)

u_website =
  Website.create!(
    name: 'Universal Store',
    url: 'https://www.universalstore.com',
    query_string_key_page: 'p',
    query_string_key_search: 'q'
  )
u_website.website_url_htmls.create!(
  url_extension: '/mens/t-shirts.html',
  category: @male_tops,
  scraper_html: universal_scraper,
  website_url_function: @url_function_page
)
