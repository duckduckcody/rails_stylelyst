# genders
@male = Gender.create!(name: 'Male')
@female = Gender.create!(name: 'Female')
# categories
@tops = Category.create!(name: 'Tops')
@bottoms = Category.create!(name: 'Bottoms')
@jackets = Category.create!(name: 'Jackets')
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
@ck_website.website_url_htmls.create!(url_extension: '/collections/mens-tops', website_url_function: @url_function_page, gender: @male, category: @tops, scraper_html: @ck_html_scraper)
@ck_website.website_url_htmls.create!(url_extension: '/collections/womens-tops', website_url_function: @url_function_page, gender: @female, category: @tops, scraper_html: @ck_html_scraper)