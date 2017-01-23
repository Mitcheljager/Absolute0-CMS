Rails.application.routes.draw do
  resources :pages
  resources :blocks
  resources :columns
  resources :components
  resources :menus

  # Root
  root to: 'pages#home'
  get 'admin' => 'pages#index'

  # Login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'

  # Sorting
  post '/admin/blocks/sort' => 'blocks#sort'
  post '/admin/pages/sort' => 'pages#sort'

  # Json
  get 'pages/json/list.json' => 'pages#list'
  get 'blocks/json/list.json' => 'blocks#list'
  get 'columns/json/list.json' => 'columns#list'
  get 'components/json/list.json' => 'components#list'
  get 'pages/template/:id.json' => 'pages#template'
  get 'components/template/:id.json' => 'components#template'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
