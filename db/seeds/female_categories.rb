@female = Gender.create!(name: 'Female')

# tops
@female_tops = Category.create!(name: 'All Tops', gender: @female)
@female_dresses = Category.create!(name: 'Dresses', gender: @female)
@female_jackets = Category.create!(name: 'Jackets', gender: @female)
@female_hoodies = Category.create!(name: 'Hoodies', gender: @female)
@female_crop_tops = Category.create!(name: 'Crop Tops', gender: @female)
@female_sleeveless = Category.create!(name: 'Sleeveless', gender: @female)
@female_bralettes = Category.create!(name: 'Bralettes', gender: @female)
@female_bodysuits = Category.create!(name: 'Bodysuits', gender: @female)
@female_camis = Category.create!(name: 'Camis', gender: @female)
@female_long_sleeve = Category.create!(name: 'Long Sleeve', gender: @female)
@female_off_shoulder_tops = Category.create!(name: 'Off the Should Tops', gender: @female)
@female_printed_tees = Category.create!(name: 'Printed Tees', gender: @female)
@female_short_sleeve = Category.create!(name: 'Short Sleeve', gender: @female)

# bottoms
@female_bottoms = Category.create!(name: 'All Bottoms', gender: @female)
@female_jeans = Category.create!(name: 'Jeans', gender: @female)
@female_leggings = Category.create!(name: 'Leggings', gender: @female)
@female_shorts = Category.create!(name: 'Shorts', gender: @female)
@female_skirts = Category.create!(name: 'Skirts', gender: @female)
@female_track_pants = Category.create!(name: 'Track Pants', gender: @female)

# misc
@female_festival = Category.create!(name: 'Festival Outfits', gender: @female)
@female_clearance = Category.create!(name: 'Clearance', gender: @female)
@female_swimwear = Category.create!(name: 'Swimwear', gender: @female)
@female_activewear = Category.create!(name: 'Activewear', gender: @female)