Rails.application.routes.draw do
  resources :url_shortener, only: %i[new create show destroy]
end
