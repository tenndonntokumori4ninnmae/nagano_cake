Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only:[:index,:show]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:edit,:update,:create]
    resources :items, only:[:index,:show,:edit,:new,:update,:create]
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'homes/top'
  end

  resources :items, only:[:index,:show], controllers: {
  items:    'public/items'
}

  resources :customers, only:[:show,:edit,:update], controllers: {
  customers:    'public/customers'
}

  resources :addresses, only:[:index,:edit,:update,:destroy,:create], controllers: {
  addresses:    'public/addresses'
}

 resources :orders, only:[:index,:new,:show,:create], controllers: {
  orders:    'public/orders'
}

 resources :cart_items, only:[:index,:create,:update,:dest], controllers: {
  cart_items:    'public/cart_items'
}
  get '/orders/confirm', to: 'public/orders#confirm'
  get '/orders/thanks', to: 'public/orders#thanks'
  get '/customers/out', to: 'public/customers#out'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
