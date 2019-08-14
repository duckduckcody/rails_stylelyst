class GenerateUrl
  include Interactor

  # generate a url given a website_url active record and page_number
  # @returns context.url
  def call
    website_url = context.website_url
    page_number = context.page_number
    query_string = generate_query_string(website_url, page_number)
    context.url = context.website_url.website.url + context.website_url.url_extension + query_string
  end

  def generate_query_string(website_url, page_number)
    '?' + {website_url.website.query_string_key_page => page_number}.to_query
  end
end
