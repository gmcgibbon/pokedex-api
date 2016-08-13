Rails.application.routes.draw do
  post :user_token, to: 'user_token#create'
  resources :pokemons, except: %i(index)
end
