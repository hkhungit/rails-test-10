Rails.application.routes.draw do
  devise_for :users
  resources :comments do
    member do
      post :reply
      post :dislike
      post :like
    end

  end
  root 'comments#index'
end
