Rails.application.routes.draw do
  get 'menus/create'

  get 'website_settings/edit'

  resources :pages
  resources :blocks
  resources :columns
  resources :components

  root to: 'pages#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'

  get 'admin' => 'pages#index'

  post '/blocks/sort' => 'blocks#sort'

  get 'pages/json/list.json' => 'pages#list'
  get 'blocks/json/list.json' => 'blocks#list'
  get 'columns/json/list.json' => 'columns#list'
  get 'components/json/list.json' => 'components#list'
  get 'pages/template/:id.json' => 'pages#template'
  get 'components/template/:id.json' => 'components#template'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
