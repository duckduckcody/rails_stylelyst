iconic_html_scraper = ScraperHtml.new(container_selector: 'div.product.columns')
iconic_html_scraper.scraper_html_component_texts.new(
  name: 'name', selector: 'span.name'
)
iconic_html_scraper.scraper_html_component_prices.new(
  name: 'price', selector: 'span.new-price,span.price'
)
iconic_html_scraper.scraper_html_component_prices.new(
  name: 'old-price', selector: 'span.old-price'
)
iconic_html_scraper.scraper_html_component_images.new(
  name: 'image', selector: 'span.image-frame'
)
iconic_html_scraper.scraper_html_component_links.new(
  name: 'link', selector: 'a.product-details'
)

the_iconic_website =
  Website.create!(
    name: 'The Iconic',
    url: 'https://www.theiconic.com.au',
    query_string_key_page: 'page',
    query_string_key_search: 'q'
  )
# male
the_iconic_website.website_url_htmls.create!(
  url_extension: '/mens-clothing-tops',
  website_url_function: @url_function_page,
  category: @male_tops,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/mens-clothing-pants',
  website_url_function: @url_function_page,
  category: @male_bottoms,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/mens-clothing-coats-jackets',
  website_url_function: @url_function_page,
  category: @male_jackets,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/mens-clothing-sweats-hoodies',
  website_url_function: @url_function_page,
  category: @male_hoodies,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/mens-sale',
  website_url_function: @url_function_page,
  category: @male_clearance,
  scraper_html: iconic_html_scraper
)
# female
the_iconic_website.website_url_htmls.create!(
  url_extension: '/womens-clothing-tops',
  website_url_function: @url_function_page,
  category: @female_tops,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/womens-clothing-dresses',
  website_url_function: @url_function_page,
  category: @female_dresses,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/womens-clothing-pants',
  website_url_function: @url_function_page,
  category: @female_bottoms,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/womens-clothing-coats-jackets',
  website_url_function: @url_function_page,
  category: @female_jackets,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/womens-clothing-sweats-hoodies',
  website_url_function: @url_function_page,
  category: @female_hoodies,
  scraper_html: iconic_html_scraper
)
the_iconic_website.website_url_htmls.create!(
  url_extension: '/womens-sale',
  website_url_function: @url_function_page,
  category: @female_clearance,
  scraper_html: iconic_html_scraper
)
