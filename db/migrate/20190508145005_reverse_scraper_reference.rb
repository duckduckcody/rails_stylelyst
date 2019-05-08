class ReverseScraperReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :scraper_htmls, :website_url_html_id
    add_reference :website_url_htmls, :scraper_html
  end
end
