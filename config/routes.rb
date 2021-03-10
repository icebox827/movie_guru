Rails.application.routes.draw do
  root 'sessions#new'
 
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
  resources :categories, only: %i[index new create show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    post '/vote/', to: 'votes#create'
    delete '/vote/', to: 'votes#destroy'
  end
  scope :sessions do
    get 'sign_out' => 'sessions#destroy'
  end
end
