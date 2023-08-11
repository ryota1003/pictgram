Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'
  #第2引数が省略されているのは第1引数と同じだから(to:pages#helpが省略されている)

  get('/login',   to: 'sessions#new')
  #get('第1引数', '第2引数')
  #第1引数にアクセスがきたら第2引数へ
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites',  to: 'favorites#destroy'

  get 'comments/index'
  #comments/indexとうってもアクセスエラーになるのはなぜか。
  get 'comments/new'
  post '/comments', to: 'comments#create'
  
  delete 'topics/:id', to: 'topics#destroy'
  #おくられてきたtopics/idをtopicscontrollerのdestroyアクションにつなげる。
end

