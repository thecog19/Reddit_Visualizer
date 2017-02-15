Rails.application.routes.draw do
  root "staticpages#index"

  scope :api do
    scope :v1 do
      resources :subreddits, format: :json
    end
  end
end
