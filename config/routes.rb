Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes
  get '/recipes/:id/edit_ingredients', to: 'recipes#edit_ingredients', as: :edit_ingredients
  get '/recipes/:id/edit_directions', to: 'recipes#edit_directions', as: :edit_directions

  get 'users/signup', to: 'users#new'
  resources :users, except: :new

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end






