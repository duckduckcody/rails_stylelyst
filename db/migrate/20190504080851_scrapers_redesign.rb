class ScrapersRedesign < ActiveRecord::Migration[5.2]
  def change
    drop_table :scrapers
    rename_table :scraper_component_images, :scraper_html_component_images
    rename_table :scraper_component_links, :scraper_html_component_links
    rename_table :scraper_component_prices, :scraper_html_component_prices
    rename_table :scraper_component_texts, :scraper_html_component_texts
    remove_column :scraper_components, :scraper_id
    add_reference :scraper_components, :scraper_html
    rename_table :scraper_components, :scraper_html_components
    add_column :scraper_htmls, :container_selector, :string
  end
end
