Rails.application.routes.draw do

  root 'users#show'
  devise_for :users

  get 'about' => 'welcome#about'


end
