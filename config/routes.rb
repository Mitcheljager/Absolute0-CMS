Rails.application.routes.draw do
  get 'columns/new'

  get 'columns/edit'

  get 'columns/show'

  resources :pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
