class FindWebsiteUrl
  include Interactor

  # get website_url active record for a website based on category and url function
  # @returns context.website_url
  def call
    website = context.website
    category = context.category
    url_function = context.url_function
    context.website_url = context.website.website_url_htmls
      .find_by(
          category: context.category,
          website_url_function: context.url_function
      )
  end
end
