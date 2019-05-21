class ScraperHtmlComponentPrice < ScraperHtmlComponent
    def scrape(params)
        price = nil
        selectors = self.selector.split(',')
        selectors.each { |selector|
            price = scrape_price(params[:html], selector)
            break if price != 0.0
        }
        return price
    end

    def scrape_price(html, selector)
        html.css(selector).text.tr('$','').to_f
    end
end
