beginning_boutique_scraper = Scraper.new(container_selector: 'div.product-card')
beginning_boutique_scraper.scraper_field_texts.new(
  name: 'name', selector: 'p.product-title'
)
beginning_boutique_scraper.scraper_field_texts.new(
  name: 'sizzle_text', selector: 'div.product-promo-block'
)
beginning_boutique_scraper.scraper_field_texts.new(
  name: 'brand', selector: 'p.product-card__vendor'
)
beginning_boutique_scraper.scraper_field_prices.new(
  name: 'price', selector: 'span.product-price--on-sale,span.money'
)
beginning_boutique_scraper.scraper_field_prices.new(
  name: 'old-price', selector: 'span.strike--red'
)
beginning_boutique_scraper.scraper_field_images.new(
  name: 'image', selector: 'div.product-card__image-wrapper'
)
beginning_boutique_scraper.scraper_field_links.new(
  name: 'link', selector: 'a.product-card-image-wrapper'
)

bb_website =
  Website.create!(
    name: 'Beginning Boutique',
    url: 'https://www.beginningboutique.com.au',
    scraper: beginning_boutique_scraper,
    query_string_key_page: 'page',
    query_string_key_search: 'q'
  )
bb_website.website_pages.create!(
  url_extension: '/collections/tops', category: @female_tops
)
bb_website.website_pages.create!(
  url_extension: '/collections/dresses', category: @female_dresses
)
bb_website.website_pages.create!(
  url_extension: '/collections/crop-tops', category: @female_crop_tops
)
bb_website.website_pages.create!(
  url_extension: '/collections/sleeveless', category: @female_sleeveless
)
bb_website.website_pages.create!(
  url_extension: '/collections/bralettes', category: @female_bralettes
)
bb_website.website_pages.create!(
  url_extension: '/collections/bodysuits', category: @female_bodysuits
)
bb_website.website_pages.create!(
  url_extension: '/collections/camis', category: @female_camis
)
bb_website.website_pages.create!(
  url_extension: '/collections/long-sleeve', category: @female_long_sleeve
)
bb_website.website_pages.create!(
  url_extension: '/collections/off-shoulder-styles',
  category: @female_off_shoulder_tops
)
bb_website.website_pages.create!(
  url_extension: '/collections/printed-tee-s', category: @female_printed_tees
)
bb_website.website_pages.create!(
  url_extension: '/collections/short-sleeve', category: @female_short_sleeve
)

bb_website.website_pages.create!(
  url_extension: '/collections/festival-outfits', category: @female_festival
)
bb_website.website_pages.create!(
  url_extension: '/collections/sale', category: @female_clearance
)
bb_website.website_pages.create!(
  url_extension: '/collections/swimwear', category: @female_swimwear
)
bb_website.website_pages.create!(
  url_extension: '/collections/activewear', category: @female_activewear
)
bb_website.website_pages.create!(
  url_extension: '/collections/bottoms', category: @female_bottoms
)
bb_website.website_pages.create!(
  url_extension: '/collections/jeans', category: @female_jeans
)
bb_website.website_pages.create!(
  url_extension: '/collections/leggings', category: @female_leggings
)
bb_website.website_pages.create!(
  url_extension: '/collections/shorts', category: @female_shorts
)
bb_website.website_pages.create!(
  url_extension: '/collections/skirts', category: @female_skirts
)
bb_website.website_pages.create!(
  url_extension: '/collections/track-pants', category: @female_track_pants
)
