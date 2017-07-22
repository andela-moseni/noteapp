Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes

  authenticated :user do
    root 'notes#index'
  end

  root 'welcome#index'

end
