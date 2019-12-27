# url functions
# 'male_categories', 'the_iconic', 'culture_kings', 'universal'
fileNames = %w[
  male_categories
  female_categories
  the_iconic
  culture_kings
  universal
  beginning_botique
]
fileNames.each do |fileName|
  require File.expand_path(File.dirname(__FILE__)) + "/seeds/#{fileName}.rb"
end
