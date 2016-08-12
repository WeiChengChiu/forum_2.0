Rails.application.routes.draw do

  devise_for :users
  resources :topics do
    resources :comments, :controller => "topic_comments"
  end

  root "topics#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
