Rails.application.routes.draw do
  resources :boards, only: [:index, :show, :new, :create, :destroy] do
    post 'tiles/:tile_id/check_surrounding_tile', to: 'tiles#check_surrounding_tile', as: :check_surrounding_tile
  end

  root 'boards#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
