@male = Gender.create!(name: 'Male')

# tops
@male_tops = Category.create!(name: 'All Tops', gender: @male)
@male_jackets = Category.create!(name: 'Jackets', gender: @male)
@male_hoodies = Category.create!(name: 'Hoodies', gender: @male)

# bottoms
@male_bottoms = Category.create!(name: 'All Bottoms', gender: @male)

# misc
@male_clearance = Category.create!(name: 'Clearance', gender: @male)