@male = Gender.create!(name: 'Mens')

# tops
@male_tops = Category.create!(name: 'All Tops', gender: @male)
@male_jackets = Category.create!(name: 'Jackets', gender: @male)
@male_hoodies = Category.create!(name: 'Hoodies', gender: @male)

# bottoms
@male_bottoms = Category.create!(name: 'All Bottoms', gender: @male)
@male_pants = Category.create!(name: 'Pants', gender: @male)
@male_track_pants = Category.create!(name: 'Track Pants', gender: @male)
@male_joggers = Category.create!(name: 'Joggers', gender: @male)
@male_jeans = Category.create!(name: 'Jeans', gender: @male)
@male_shorts = Category.create!(name: 'Shorts', gender: @male)

# misc
@male_clearance = Category.create!(name: 'Clearance', gender: @male)