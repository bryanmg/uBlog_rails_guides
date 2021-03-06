Rails.application.routes.draw do
  root "publications#index"

  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"

  resources :publications do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
