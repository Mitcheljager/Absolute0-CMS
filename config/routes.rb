Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/new'

  get 'pages/edit'

  get 'pages/show'

  get 'blocks/new'

  get 'blocks/edit'

  get 'blocks/show'

  get 'components/new'

  get 'components/edit'

  get 'components/show'

  get 'items/new'

  get 'items/edit'

  get 'items/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
