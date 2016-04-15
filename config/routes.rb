Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users

  resources :registered_applications, except: [:update]

  get 'about' => 'welcome#about'
end
