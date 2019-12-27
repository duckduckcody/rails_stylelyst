class GenerateUrl
  include Interactor

  # generate a url given a website_url active record and page_number
  # @returns context.url
  def call
    website = context.website
    url_extension = context.url_extension
    page_number = context.page_number
    query_string = generate_query_string(website, page_number)
    context.url = website.url + url_extension + query_string
  end

  def generate_query_string(website, page_number)
    '?' + { website.query_string_key_page => page_number }.to_query
  end
end
