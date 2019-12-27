# the_iconic
# culture_kings
# universal
# male_categories

fileNames = %w[
  female_categories
  male_categories
  beginning_botique
  culture_kings
]
fileNames.each do |fileName|
  require File.expand_path(File.dirname(__FILE__)) + "/seeds/#{fileName}.rb"
end
