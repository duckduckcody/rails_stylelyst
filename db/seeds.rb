# url functions
@url_function_search = WebsiteUrlFunction.create!(name: 'search')
@url_function_page = WebsiteUrlFunction.create!(name: 'page')
# genders
@male = Gender.create!(name: 'Male')
@female = Gender.create!(name: 'Female')
# categories
@male_tops = Category.create!(name: 'All Tops', gender: @male)
@male_bottoms = Category.create!(name: 'All Bottoms', gender: @male)
@male_jackets = Category.create!(name: 'Jackets', gender: @male)
@male_hoodies = Category.create!(name: 'Hoodies', gender: @male)
@male_clearance = Category.create!(name: 'Clearance', gender: @male)

@female_tops = Category.create!(name: 'All Tops', gender: @female)
@female_dresses = Category.create!(name: 'Dresses', gender: @female)
@female_bottoms = Category.create!(name: 'All Bottoms', gender: @female)
@female_jackets = Category.create!(name: 'Jackets', gender: @female)
@female_hoodies = Category.create!(name: 'Hoodies', gender: @female)
@female_clearance = Category.create!(name: 'Clearance', gender: @female)
@female_festival = Category.create!(name: 'Festival Outfits', gender: @female)

fileNames = ['beginning_botique', 'the_iconic', 'culture_kings']
fileNames.each do |fileName|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{fileName}.rb"
end