@male = Gender.create({:name => 'Male'})
@female = Gender.create({:name => 'Female'})
@tops = Category.create({:name => 'Tops'})
@bottoms = Category.create({:name => 'Bottoms'})

# culture kings
@ck_website = Website.create(name: 'Culture Kings', url: 'https://www.culturekings.com.au', query_string_key_page: 'page', query_string_key_search: 'query')
@tops_url = @ck_website.website_url_htmls.create(url_extension: '/collections/mens-tops', gender: @male, category: @tops)
@scraper = @tops_url.create_scraper_html(container_selector: 'div.product-card')
@scraper.scraper_html_component_texts.create(name: 'name', selector: 'p.product-title')
@scraper.scraper_html_component_prices.create(name: 'price', selector: 'span.money')
@scraper.scraper_html_component_images.create(name: 'image', selector: 'div.product-card__image')
@scraper.scraper_html_component_links.create(name: 'link', selector: 'a.product-card__link')