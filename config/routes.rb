Rails.application.routes.draw do
  root 'welcome#index'

  get '/trending', to: 'trending_fonts#index', as: 'trending'
  get '/popular', to: 'popular_fonts#index', as: 'popular'
  get '/recent', to: 'recent_fonts#index', as: 'recent'
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout


  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      namespace :fonts do
        resources :trending, only: [:index]
        resources :recent, only: [:index]
        resources :popular, only: [:index]
      end
    end
  end

  match 'http://jbernesser.me/trendwolf/*' => 'api#options', :via => [:options]
end
