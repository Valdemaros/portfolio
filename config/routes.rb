Rails.application.routes.draw do
  root "pages#home"

  get "services", to: "pages#services"
  get "tz", to: "pages#tz"

  resources :projects
end
