Rails.application.routes.draw do
  resources :madlibs
  get '/madlibs/:id/mad', to: 'madlibs#madlib', as: :lib
  post '/madlibs/:id/mad', to: 'madlibs#libbed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
