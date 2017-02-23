Rails.application.routes.draw do
  root "staticpages#index"
  get '/blog', to: redirect('/blog.html')

  scope :api do
    scope :v1 do
      resources :subreddits, format: :json
      resources :paths, only: [:show], format: :json
    end
  end

end
