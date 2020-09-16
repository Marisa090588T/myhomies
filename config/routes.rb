Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: :show

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :homes, only: [:new, :create, :show] do
    resources :expenses, only: [:create, :new, :index, :show] do
      resources :expense_shares, only: :update
    end
    
    resources :chores, only: [:create, :new, :index, :show] do
      patch :done, on: :member
    end

    resources :chores, only: [:create, :new, :index, :show] do
      patch :done, on: :member
    end
   resources :homies, only: [:index, :new, :create]

  # resources :expense_share, only: [] do
  #   patch :check, on: :member
  # end

end
