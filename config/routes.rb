Rails.application.routes.draw do
  root 'shortener#index'
  get "/:short_url", to: "shortener#show"
  get "shortened/:short_url", to: "shortener#shortened", as: :shortened
  post "shortener/create"
end
