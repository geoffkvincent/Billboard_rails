Rails.application.routes.draw do
  root 'billboards#index'

  resources :billboards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
