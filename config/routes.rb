Rails.application.routes.draw do
  resources :pages
  resources :blocks
  resources :columns
  resources :components

  get 'admin' => 'pages#index'

  get 'pages/json/list.json' => 'pages#list'
  get 'blocks/json/list.json' => 'blocks#list'
  get 'columns/json/list.json' => 'columns#list'
  get 'components/json/list.json' => 'components#list'
  get 'pages/template/:id.json' => 'pages#template'
  get 'components/template/:id.json' => 'components#template'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
