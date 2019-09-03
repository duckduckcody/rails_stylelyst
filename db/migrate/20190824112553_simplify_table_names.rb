class SimplifyTableNames < ActiveRecord::Migration[5.2]
  def change
    rename_table :scraper_html_component_images, :scraper_field_images
    rename_table :scraper_html_component_links, :scraper_field_links
    rename_table :scraper_html_component_prices, :scraper_field_prices
    rename_table :scraper_html_component_texts, :scraper_field_texts
    rename_table :scraper_html_components, :scraper_fields
    rename_table :scraper_htmls, :scrapers
    rename_table :website_url_htmls, :website_pages
  end
end
