Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users

  resources :registered_applications, except: [:update]

  get 'about' => 'welcome#about'

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end
