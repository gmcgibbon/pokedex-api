Rails.application.routes.draw do
  root              to: 'application#redirect'
  post :user_token, to: 'user_token#create'
  resources :pokemons, except: %i(index)
end
