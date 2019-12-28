universal_scraper = Scraper.new(container_selector: 'li.item')
universal_scraper.scraper_html_component_texts.new(
  name: 'name', selector: 'strong.product-item-name'
)

# universal_scraper.scraper_html_component_prices.new(
#   name: 'price', selector: 'span.regular-price'
# )
# universal_scraper.scraper_html_component_prices.new(
#   name: 'old-price', selector: 'p.old-price'
# )
# universal_scraper.scraper_html_component_images.new(
#   name: 'image', selector: 'a.product-image'
# )
# universal_scraper.scraper_html_component_links.new(
#   name: 'link', selector: 'a.product-image'
# )

u_website =
  Website.create!(
    name: 'Universal Store',
    url: 'https://www.universalstore.com',
    scraper: universal_scraper,
    query_string_key_page: 'p',
    query_string_key_search: 'q',
    emulate_browser_get: false
  )
u_website.website_pages.create!(
  url_extension: '/mens/t-shirts.html', category: @male_tops
)
