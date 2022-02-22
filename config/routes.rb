Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :todo_lists do
    resources :todo_items
    patch '/star', to: 'todo_lists#star'
  end

  root 'todo_lists#index'
end
