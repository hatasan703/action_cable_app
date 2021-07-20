Rails.application.routes.draw do
  get 'chats/index'
  get 'chats/show'
  devise_for :users
  root to: 'spots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chats
  resources :spots

  resources :users do
    get 'chats/:id' => 'users#user_chat'
  end
end
