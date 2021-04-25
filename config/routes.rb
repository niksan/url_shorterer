Rails.application.routes.draw do
  resources :urls, only: [:create, :show] do
    resources :stats, only: :index
  end
end
