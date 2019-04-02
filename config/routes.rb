Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }


  resources :products do
  resources :comments

end

  resources :products do
  resources :orders

end

resources :users

resources :payments

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  get 'simple_pages/landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#landing_page'
  post 'payments/create'
  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'




end
