Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to: 'public/homes#top'
  get "homes/about" => "public/homes#about"

  namespace :admin do
    resources :customers, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :destroy]
    #resource :customers, only: :destroy
  end

  scope module: :public do
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :items, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :item_comments, only: [:create, :destroy]
    end
    resources :relationships, only: [:create, :destroy]
    get "search" => "searches#search"
  end

  devise_scope :public do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end