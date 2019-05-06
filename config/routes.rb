Rails.application.routes.draw do
  root to: 'addresses#index'

  post '/', to: 'addresses#index', as: :search_address
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
