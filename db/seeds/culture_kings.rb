ck_html_scraper = ScraperHtml.new(container_selector: 'div.product-card')
ck_html_scraper.scraper_html_component_texts.new(name: 'name', selector: 'p.product-title')
ck_html_scraper.scraper_html_component_prices.new(name: 'price', selector: 'span.product-price')
ck_html_scraper.scraper_html_component_prices.new(name: 'old-price', selector: 'span.product-compare-price')
ck_html_scraper.scraper_html_component_images.new(name: 'image', selector: 'div.product-card__image')
ck_html_scraper.scraper_html_component_links.new(name: 'link', selector: 'a.product-card__link')

ck_website = Website.create!(name: 'Culture Kings', url: 'https://www.culturekings.com.au', query_string_key_page: 'page', query_string_key_search: 'query')
#male
ck_website.website_url_htmls.create!(url_extension: '/collections/mens-tops', website_url_function: @url_function_page, category: @male_tops, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/mens-bottoms', website_url_function: @url_function_page, category: @male_bottoms, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/mens-tops-jacket', website_url_function: @url_function_page, category: @male_jackets, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/mens-tops-hood', website_url_function: @url_function_page, category: @male_hoodies, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/markdowns/gender-mens', website_url_function: @url_function_page, category: @male_clearance, scraper_html: ck_html_scraper)
#female
ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops', website_url_function: @url_function_page, category: @female_tops, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops-dress', website_url_function: @url_function_page, category: @female_dresses, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/womens-bottoms', website_url_function: @url_function_page, category: @female_bottoms, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops-jacket', website_url_function: @url_function_page, category: @female_jackets, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops-hood', website_url_function: @url_function_page, category: @female_hoodies, scraper_html: ck_html_scraper)
ck_website.website_url_htmls.create!(url_extension: '/collections/markdowns/gender-womens', website_url_function: @url_function_page, category: @female_clearance, scraper_html: ck_html_scraper)