Rails.application.routes.draw do
  resources :pokemons, except: %i(index)
end
