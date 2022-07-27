Rails.application.routes.draw do

  #get 'users/new' гет запрос не может создавать ничего, точнее это не правильно
  #get 'users/create'пропишем через ресоурс
#post '/questions', to: 'questions#create'
#patch '/questions/:id', to: 'questions#update'
#delete '/questions/:id', to: 'questions#destroy' єто все заменяется ==> resources :questions
root to: 'questions#index'
resources :questions
resource :session, only: %i[new create destroy]
resources :users, only: %i[new create]
end
