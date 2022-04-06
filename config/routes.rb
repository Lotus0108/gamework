Rails.application.routes.draw do
  namespace :admin do
    get 'review/index'
    get 'review/destroy'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :public do
    get 'relationships/create'
    get 'relationships/destroy'
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'item_comments/create'
    get 'item_comments/destroy'
  end
  namespace :public do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/create'
    get 'items/update'
    get 'items/destroy'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to: 'public/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end