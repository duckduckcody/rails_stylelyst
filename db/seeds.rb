# url functions
@url_function_search = WebsiteUrlFunction.create!(name: 'search')
@url_function_page = WebsiteUrlFunction.create!(name: 'page')

fileNames = ['female_categories', 'male_categories', 'beginning_botique', 'the_iconic', 'culture_kings']
fileNames.each do |fileName|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{fileName}.rb"
end