# universal

fileNames = %w[
  female_categories
  male_categories
  beginning_botique
  culture_kings
  the_iconic
]
fileNames.each do |fileName|
  require File.expand_path(File.dirname(__FILE__)) + "/seeds/#{fileName}.rb"
end
