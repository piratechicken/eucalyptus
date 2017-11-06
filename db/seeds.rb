simon = User.create!(email: 'simon@simon', password: '1234567')
gretch = User.create!(email: 'gretch@gretch', password: '1234567')
hannah = User.create!(email: 'hannah@hannah', password: '1234567')
julia = User.create!(email: 'julia@julia', password: '1234567')
ruegan = User.create!(email: 'ruegan@ruegen', password: '1234567')
samantha = User.create!(email: 'samantha@samantha', password: '1234567')
bridget = User.create!(email: 'bridgette@bridgette', password: '1234567')
alex = User.create!(email: 'alex@alex', password: '1234567')

climber = GrowthForm.create!(name: 'climber', description: '')
ferm = GrowthForm.create!(name: 'fern', description: '')
aquatic = GrowthForm.create!(name: 'aquatic', description: '')
grass = GrowthForm.create!(name: 'grass', description: '')
herb = GrowthForm.create!(name: 'herb', description: '')
shrub = GrowthForm.create!(name: 'shrub', description: '')
small_tree = GrowthForm.create!(name: 'small tree', description: '')
medium_tree = GrowthForm.create!(name: 'medium tree', description: '')
large_tree = GrowthForm.create!(name: 'large tree', description: '')

nutans = Specie.create!(name: 'Pterostlis nutans',common_name: 'nodding greenhood', growth_form: herb)
regnans = Specie.create!(name: 'Eucalyptus regnans',common_name: 'mountain ash', growth_form: large_tree)
spear = Specie.create!(name: 'Austrostipa flavescens',common_name: 'coast spear grass', growth_form: grass)
cushion = Specie.create!(name: 'Leucophyta brownii',common_name: 'cushion bush', growth_form: shrub)

plants = [nutans, regnans, spear, cushion]
users = [simon, gretch, hannah, julia, ruegan, samantha, bridget]
titles = ['Buy my','For sale: ','For sale, a bunch of', 'Check it out. Some', 'Cheap ']

users.each do |user|
  firstname = user.email.split('@').first
  Profile.create!(first_name: firstname, last_name: 'Doe', user: user)
end

16.times do
  species = plants.sample
  title = "#{titles.sample} #{species.common_name}"
  Listing.create!(title: title, user: users.sample, specie: species, price_cents: rand(500..20000))
end