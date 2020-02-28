Rails.application.routes.draw do
  root "home#top"
  devise_for :users, :controllers => { registrations: 'registrations' }

  get "users/index" => "users#index"
  get "users/show" => "users#show"

  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id/likeShow" => "posts#like_show"
  get "posts/:id/likeUserShow" => "posts#like_user_show"

  get "departments/index" => "departments#index"
  get "departments/new" => "departments#new"
  get "departments/:id" => "departments#show"
  post "departments/create" => "departments#create"
  get "departments/:id/edit" => "departments#edit"
  post "departments/:id/update" => "departments#update"
  post "departments/:id/destroy" => "departments#destroy"

  get "/" => "home#top"
end
