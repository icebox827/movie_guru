Rails.application.routes.draw do
  root 'sessions#new'
  get 'users/new'
  resources :sessions, only: %i[new create destroy]
  resources :categories
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :sessions do
    get 'sign_out' => 'sessions#destroy'
  end
end
