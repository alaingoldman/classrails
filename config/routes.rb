Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get  '/about'   => 'static_pages#about'
  get  '/contact' => 'static_pages#contact'
  resources :microposts
end