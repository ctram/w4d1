Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index, :create]
    resources :contact_shares, only: [:create, :destroy]
  end

  resources :contacts, only: [:destroy, :show, :update]
end
