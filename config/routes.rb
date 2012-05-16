HelpTranslate::Application.routes.draw do
  resources :translations

  resources :dictionaries
  resources :words 
  resources :texts

  root to: 'texts#index'

  match '/auth/:provider/callback', to: 'sessions#create' 
  match '/auth/failure' => redirect('/signin')
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signup' => redirect('/auth/identity/register'), :as => :signup
  match '/signin' => redirect('/auth/identity'), :as => :signin
end
