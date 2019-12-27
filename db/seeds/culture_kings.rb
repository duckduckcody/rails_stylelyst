ck_scraper =
  Scraper.new(
    container_selector:
      'div.column.is-half-mobile.is-one-third-tablet.is-one-quarter-desktop.is-one-quarter-widescreen.is-one-quarter-fullhd'
  )
ck_scraper.scraper_field_texts.new(
  name: 'name', selector: 'h4.search-result-product-title'
)
ck_scraper.scraper_field_prices.new(
  name: 'price', selector: 'p.Typography_root__30Ym3'
)
# ck_scraper.scraper_field_prices.new(
#   name: 'old-price', selector: 'span.product-compare-price'
# )
ck_scraper.scraper_field_images.new(
  name: 'image', selector: 'img.ProductImagel_image__3IRFz'
)
ck_scraper.scraper_field_links.new(
  name: 'link', selector: 'a.ProductHit_collectionImgLink__NjgIf'
)

ck_website =
  Website.create!(
    name: 'Culture Kings',
    url: 'https://www.culturekings.com.au',
    scraper: ck_scraper,
    query_string_key_page: 'page',
    query_string_key_search: 'query',
    emulate_browser_get: true
  )
#male
ck_website.website_pages.create!(
  url_extension: '/collections/mens-tops', category: @male_tops
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-bottoms', category: @male_bottoms
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-tops-jacket', category: @male_jackets
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-tops-hood', category: @male_hoodies
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-bottoms-pants', category: @male_pants
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-bottoms-track-pants',
  category: @male_track_pants
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-bottoms-jogger', category: @male_joggers
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-bottoms-jeans', category: @male_jeans
)
ck_website.website_pages.create!(
  url_extension: '/collections/mens-bottoms-shorts', category: @male_shorts
)
ck_website.website_pages.create!(
  url_extension: '/collections/markdowns/gender-mens', category: @male_clearance
)

#female
ck_website.website_pages.create!(
  url_extension: '/collections/womens-tops', category: @female_tops
)
ck_website.website_pages.create!(
  url_extension: '/collections/womens-tops-dress', category: @female_dresses
)
ck_website.website_pages.create!(
  url_extension: '/collections/womens-bottoms', category: @female_bottoms
)
ck_website.website_pages.create!(
  url_extension: '/collections/womens-tops-jacket', category: @female_jackets
)
ck_website.website_pages.create!(
  url_extension: '/collections/womens-tops-hood', category: @female_hoodies
)
ck_website.website_pages.create!(
  url_extension: '/collections/markdowns/gender-womens',
  category: @female_clearance
)
