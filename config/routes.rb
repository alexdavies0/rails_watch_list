Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :bookmarks, only: [:new, :create, :destroy]

  # resources :lists, only: [:index, :new, :create, :destroy]
  root to: 'lists#index'
  resources :lists do
    resources :bookmarks, except: :destroy, only: %i[new create show edit]
  end

  resources :bookmarks, only: :destroy

  # get 'lists',        to: 'lists#index',          as: :lists
  # get  'lists/new',   to: 'lists#new',      as: :new_list
end
