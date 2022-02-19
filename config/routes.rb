Rails.application.routes.draw do


  root to: 'public/homes#top'

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  get '/', to:'public/homes#top'
  get '/about', to:'public/homes#about'

  scope module: :public do
    resources :items, only:[:index,:show]
    resources :customers, only:[:show,:edit,:update]
    resources :addresses, only:[:index,:edit,:update,:destroy,:create]
    resources :orders, only:[:index,:new,:show,:create]
    resources :cart_items, only:[:index,:create,:update,:destroy]
    resources :ordered_items, only:[:index, :show]
  end


  get '/confirm', to: 'public/orders#confirm'
  get '/thanks', to: 'public/orders#thanks'
  get '/out', to: 'public/customers#out'

   devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}


  namespace :admin do
    resources :orders, only:[:index,:show]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:edit,:update,:create]
    resources :items, only:[:index,:show,:edit,:new,:update,:create]
  end

  namespace :admin do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
