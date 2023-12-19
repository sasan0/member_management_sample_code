Rails.application.routes.draw do
  post 'users/register', to: 'users#register'
  get 'users/index', to: 'users#index'
  put 'users/update/:id', to: 'users#update'
  delete 'users/delete/:id', to: 'users#delete'
end
