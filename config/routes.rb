Rails.application.routes.draw do
 
  devise_for :users
 resources :posts 
 resources :advertisements

  get 'about' => 'welcome#about'

  root to: "welcome#index"
end
