Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'homes#top'
   get 'home/about' => 'homes#about'

  resources :users
  # ,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
    # sがあるかどうかでidがあるかどうか　commentsにはsが必要
    # 見やすさなどでネストしているだけ
  end
end