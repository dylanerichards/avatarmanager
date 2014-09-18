Rails.application.routes.draw do
  resources :avatars

  root 'pages#index'
  get 'pages/index'
end
