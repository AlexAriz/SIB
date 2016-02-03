Rails.application.routes.draw do
  resources :universities
  resources :univercities
  get 'university/index'
  resources :universities
end
