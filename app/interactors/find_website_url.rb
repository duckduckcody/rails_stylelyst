class FindWebsiteUrl
  include Interactor

  # get website_url active record for a website based on category and url function
  # @returns context.website_url
  def call
    website = context.website
    category = context.category
    context.website_page = website.website_pages
      .find_by(category: category)
  end
end
