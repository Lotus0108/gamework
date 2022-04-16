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
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :destroy]
  end

  scope module: :public do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :item_comments, only: [:create, :destroy]
    end
    resources :relationships, only: [:create, :destroy]
    get "search" => "searches#search"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end