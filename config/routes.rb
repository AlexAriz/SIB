Rails.application.routes.draw do
  resources :universities
  get 'university/index'
end
