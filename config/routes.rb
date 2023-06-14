Rails.application.routes.draw do
  devise_for :users

  scope 'api' do
    scope 'categories' do
      get '', to: 'categories#index'
      get ':id', to: 'categories#show'
      post 'create', to: 'categories#create'
      patch 'update/:id', to: 'categories#update'
      delete 'delete/:id', to: 'categories#delete'
    end
    
    scope 'commentaries' do
      get '', to: 'commentaries#index'
      get ':id', to: 'commentaries#show'
      post 'create', to: 'commentaries#create'
      patch 'update/:id', to: 'commentaries#update'
      delete 'delete/:id', to: 'commentaries#delete'
    end

    scope 'feedbacks' do
      get '', to: 'feedbacks#index'
      get ':id', to: 'feedbacks#show'
      post 'create', to: 'feedbacks#create'
      patch 'update/:id', to: 'feedbacks#update'
      delete 'delete/:id', to: 'feedbacks#delete'
    end

    scope 'posts' do
      get '', to: 'posts#index'
      get ':id', to: 'posts#show'
      post 'create', to: 'posts#create'
      patch 'update/:id', to: 'posts#update'
      delete 'delete/:id', to: 'posts#delete'
    end

    scope 'users' do
      get 'login', to: 'users#login'
    end

  end
end
