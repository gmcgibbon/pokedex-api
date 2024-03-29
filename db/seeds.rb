# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PKMN_ID_MIN   = ENV['PKMN_ID_MIN'] || 1
PKMN_ID_MAX   = ENV['PKMN_ID_MAX'] || 25
PKMN_ID_RANGE = Array(PKMN_ID_MIN.to_i..PKMN_ID_MAX.to_i)

puts "Creating #{PKMN_ID_RANGE.size} Pokemon... (this may take awhile)"
PKMN_ID_RANGE.each do |id|
  api_pokemon = PokeAPI::Pokemon.find(id)
  db_pokemon  = Pokemon.from_api(api_pokemon).save!
  puts "##{id} #{api_pokemon.name} added."
end
