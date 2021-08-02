Rails.application.routes.draw do
  root 'home#index' 
  
  resources :rentals, only: %i(index new create update)
  post 'rentals/:id/return', to: 'rentals#return', as: 'return_rental'
  post 'rentals/:id/postpone', to: 'rentals#postpone', as: 'postpone_rental'

  resources :books
  resources :users
  resources :book_genres
end
