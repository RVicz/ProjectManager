Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    member do
      patch :complete
    end
  end

  root 'projects#index'
end
