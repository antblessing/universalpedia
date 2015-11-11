Rails.application.routes.draw do

  resources :wikis
  
  resources :charges, only: [:new, :create,]
  
  get 'charges/downgrade', :to => 'charges#downgrade'
  
  devise_for :users
  
  
  get 'welcome/index'

  get 'welcome/about'
  
  root to: 'welcome#index'

end
