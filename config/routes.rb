Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :users, only: [:index, :show, :create]
      resources :user_books, only: [:index, :show]
      resources :user_revies, only: [:index, :show]

      post '/login', to: 'sessions#create'
      post '/reauth', to: 'sessions#reauth'

      post '/book_search', to: 'books#search', as: 'book_search'
    end
  end
end
