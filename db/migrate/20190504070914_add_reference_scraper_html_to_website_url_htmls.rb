class AddReferenceScraperHtmlToWebsiteUrlHtmls < ActiveRecord::Migration[5.2]
  def change
    add_reference :scraper_htmls, :website_url_html
  end
end
