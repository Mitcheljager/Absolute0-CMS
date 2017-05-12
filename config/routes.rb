Rails.application.routes.draw do
  resources :pages
  resources :blocks
  resources :columns
  resources :components
  resources :menus

  # Root
  root to: 'pages#home'
  get 'admin' => 'pages#admin'

  # Login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'

  # Sorting
  post '/admin/pages/sort' => 'pages#sort'
  post '/admin/blocks/sort' => 'blocks#sort'
  post '/admin/columns/sort' => 'columns#sort'

  # Json
  get 'pages/json/list.json' => 'pages#list'
  get 'blocks/json/list.json' => 'blocks#list'
  get 'columns/json/list.json' => 'columns#list'
  get 'components/json/list.json' => 'components#list'
  get 'pages/template/:id.json' => 'pages#template'
  get 'components/template/:id.json' => 'components#template'

  # Pages
  get '/:id' => 'pages#show', :as => 'page_nice_path'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
