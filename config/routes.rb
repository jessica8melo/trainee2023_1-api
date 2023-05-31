Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'api' do
    get 'categories', to: 'categories#index'
    get 'categories/:id', to: 'categories#show'
    # categories/1
    # post
    # patch
    # delete
  end
end
