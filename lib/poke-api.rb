module PokeAPI
  API_VERSION  = 2.freeze
  BASE_URL     = "pokeapi.co/api/v#{API_VERSION}".freeze
end

require 'poke-api/resource'
require 'poke-api/pokemon'
