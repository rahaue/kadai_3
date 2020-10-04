Rails.application.routes.draw do
    
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show'
  post 'books' => 'books#create'
  delete 'books/:id' => 'books#destroy'
  get 'books/:id/edit' => 'books#edit'
  patch 'books/:id' => 'books#update'
  
end
