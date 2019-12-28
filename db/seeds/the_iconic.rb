iconic_scraper = Scraper.new(container_selector: 'div.product.columns')
iconic_scraper.scraper_field_texts.new(name: 'name', selector: 'span.name')
iconic_scraper.scraper_field_prices.new(
  name: 'price', selector: 'span.new-price,span.price'
)
iconic_scraper.scraper_field_prices.new(
  name: 'old-price', selector: 'span.old-price'
)
iconic_scraper.scraper_field_images.new(
  name: 'image', selector: 'span.image-frame'
)
iconic_scraper.scraper_field_links.new(
  name: 'link', selector: 'a.product-details'
)

the_iconic_website =
  Website.create!(
    name: 'The Iconic',
    url: 'https://www.theiconic.com.au',
    scraper: iconic_scraper,
    query_string_key_page: 'page',
    query_string_key_search: 'q',
    emulate_browser_get: false
  )
# male
the_iconic_website.website_pages.create!(
  url_extension: '/mens-clothing-tops', category: @male_tops
)
the_iconic_website.website_pages.create!(
  url_extension: '/mens-clothing-pants', category: @male_bottoms
)
the_iconic_website.website_pages.create!(
  url_extension: '/mens-clothing-coats-jackets', category: @male_jackets
)
the_iconic_website.website_pages.create!(
  url_extension: '/mens-clothing-sweats-hoodies', category: @male_hoodies
)
the_iconic_website.website_pages.create!(
  url_extension: '/mens-sale', category: @male_clearance
)
# female
the_iconic_website.website_pages.create!(
  url_extension: '/womens-clothing-tops', category: @female_tops
)
the_iconic_website.website_pages.create!(
  url_extension: '/womens-clothing-dresses', category: @female_dresses
)
the_iconic_website.website_pages.create!(
  url_extension: '/womens-clothing-pants', category: @female_bottoms
)
the_iconic_website.website_pages.create!(
  url_extension: '/womens-clothing-coats-jackets', category: @female_jackets
)
the_iconic_website.website_pages.create!(
  url_extension: '/womens-clothing-sweats-hoodies', category: @female_hoodies
)
the_iconic_website.website_pages.create!(
  url_extension: '/womens-sale', category: @female_clearance
)
