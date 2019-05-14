# genders
@male = Gender.create!(name: 'Male')
@female = Gender.create!(name: 'Female')
# categories
@male_tops = Category.create!(name: 'All Tops', gender: @male)
@male_bottoms = Category.create!(name: 'All Bottoms', gender: @male)
@male_jackets = Category.create!(name: 'Jackets', gender: @male)
@female_tops = Category.create!(name: 'All Tops', gender: @female)
@female_bottoms = Category.create!(name: 'All Bottoms', gender: @female)
@female_jackets = Category.create!(name: 'Jackets', gender: @female)
# url functions
@url_function_search = WebsiteUrlFunction.create!(name: 'search')
@url_function_page = WebsiteUrlFunction.create!(name: 'page')

# culture kings html scraper
@ck_html_scraper = ScraperHtml.new(container_selector: 'div.product-card')
@ck_html_scraper.scraper_html_component_texts.new(name: 'name', selector: 'p.product-title')
@ck_html_scraper.scraper_html_component_prices.new(name: 'price', selector: 'span.money')
@ck_html_scraper.scraper_html_component_images.new(name: 'image', selector: 'div.product-card__image')
@ck_html_scraper.scraper_html_component_links.new(name: 'link', selector: 'a.product-card__link')
# culture kings website and urls
@ck_website = Website.create!(name: 'Culture Kings', url: 'https://www.culturekings.com.au', query_string_key_page: 'page', query_string_key_search: 'query')
@ck_website.website_url_htmls.create!(url_extension: '/collections/mens-tops', website_url_function: @url_function_page, category: @male_tops, scraper_html: @ck_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/collections/mens-bottoms', website_url_function: @url_function_page, category: @male_bottoms, scraper_html: @ck_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/collections/mens-tops-jacket', website_url_function: @url_function_page, category: @male_jackets, scraper_html: @ck_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops', website_url_function: @url_function_page, category: @female_tops, scraper_html: @ck_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/collections/womens-bottoms', website_url_function: @url_function_page, category: @female_bottoms, scraper_html: @ck_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops-jacket', website_url_function: @url_function_page, category: @female_jackets, scraper_html: @ck_html_scraper)

# the iconic html scraper
@iconic_html_scraper = ScraperHtml.new(container_selector: 'div.product.columns')
@iconic_html_scraper.scraper_html_component_texts.new(name: 'name', selector: 'span.name')
@iconic_html_scraper.scraper_html_component_prices.new(name: 'price', selector: 'span.price')
@iconic_html_scraper.scraper_html_component_images.new(name: 'image', selector: 'span.image-frame')
@iconic_html_scraper.scraper_html_component_links.new(name: 'link', selector: 'a.product-details')
# the iconic website and urls
@ck_website = Website.create!(name: 'The Iconic', url: 'https://www.theiconic.com.au', query_string_key_page: 'page', query_string_key_search: 'q')
@ck_website.website_url_htmls.create!(url_extension: '/mens-clothing-tops', website_url_function: @url_function_page, category: @male_tops, scraper_html: @iconic_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/mens-clothing-pants', website_url_function: @url_function_page, category: @male_bottoms, scraper_html: @iconic_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/mens-clothing-coats-jackets', website_url_function: @url_function_page, category: @male_jackets, scraper_html: @iconic_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/womens-clothing-tops', website_url_function: @url_function_page, category: @female_tops, scraper_html: @iconic_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/womens-clothing-pants', website_url_function: @url_function_page, category: @female_bottoms, scraper_html: @iconic_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/womens-clothing-coats-jackets', website_url_function: @url_function_page, category: @female_jackets, scraper_html: @iconic_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/catalog/', website_url_function: @url_function_search, scraper_html: @iconic_html_scraper)

