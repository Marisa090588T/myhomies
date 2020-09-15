Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: :show

  resources :homes, only: [:create, :edit, :update] do
    resources :expenses, only: [:create, :new, :index, :show] do
      resources :expense_shares, only: :update
    end 

  #   resources :chores, only: [:create, :new, :index, :show] do
  #     patch :done, on: :member
  #   end
  end

  # resources :expense_share, only: [] do
  #   patch :check, on: :member
  # end

end
