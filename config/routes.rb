Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: :show
  resources :homies, only: [:index, :new, :create]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :homes, only: [:new, :create, :show] do
    resource :invitations, only: :update
    resources :expenses, only: [:create, :new, :index, :show] do
      resources :expense_shares, only: :update
    end
    resources :chores, only: [:create, :new, :index, :show]

    resources :expense_shares, only: [:show, :index] do
    end
  end 

  namespace :user do
    resources :chores, only: :index
    resources :expenses, only: :index
  end

  resources :chores, only: [] do
    patch :done, on: :member
  end

  resources :expenses, only: [] do
    patch :paid, on: :member
  end

  if Rails.env.development?
    get 'kitchensink', to: 'pages#kitchensink'
  end
  get "homes/:home_invite_token/invitations", to: "invitations#new", as: "new_invitation"

end
