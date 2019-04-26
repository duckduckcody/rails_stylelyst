# create:
# - website_pages

Gender.create([{:name => 'Male'},{:name => 'Female'}])
Category.create([{:name => 'Tops'},{:name => 'Bottoms'}])
# culture kings
@ck_website = Website.create(name: 'Culture Kings', url: 'https://www.culturekings.com.au')
@ck_scraper = @ck_website.create_scraper(container_selector: 'div.product-card')
@ck_scraper.scraper_component_texts.create(name: 'name', selector: 'p.product-title')
@ck_scraper.scraper_component_prices.create(name: 'price', selector: 'span.money')
@ck_scraper.scraper_component_images.create(name: 'image', selector: 'div.product-card__image')
@ck_scraper.scraper_component_links.create(name: 'link', selector: 'a.product-card__link')