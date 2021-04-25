Rails.application.routes.draw do
  resources :urls, only: [:create, :show]
end
