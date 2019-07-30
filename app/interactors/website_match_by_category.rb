class WebsiteMatchByCategory
  include Interactor

  def call
    context.websites = WebsiteUrlHtml
      .where(category: context.category)
      .map{ |category| category.website }
      .sort_by { |website| website.name }
  end
end
