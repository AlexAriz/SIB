Rails.application.routes.draw do

  resources :selection_processes

  resources :tutors
  get 'tutors/request_as_tutor/:candidate_id/:tutor_id' =>
          'tutors#request_as_tutor', as: 'request_as_tutor'
  get 'tutors/candidates/:id' => 'tutors#candidates', as:
      'candidates_of_tutor'
  get 'tutors/show_details_of_candidate/:id/:candidate_id' =>
          'tutors#show_details_of_candidate', as: 'show_details_of_candidate'

  get 'tutors/accept_candidate/:candidate_id' => 'tutors#accept_candidate', as: 'accept_candidate'
  get 'tutors/reject_candidate/:candidate_id' => 'tutors#reject_candidate', as: 'reject_candidate'

  resources :universities
  get 'university/index'

  resources :work_materials

  get 'users/index'
  get 'users/show/:id' => 'users#show', as: 'user_show'
  get 'users/edit/:id' => 'users#edit', as: 'user_edit'
  patch 'users/edit/:id' => 'users#update'
  put 'users/edit/:id' => 'users#update'

  delete 'users/destroy/:id' => 'users#destroy', as: 'user_destroy'

  resources :scholarships
  get '/request', to: "scholarships#get_request", as: 'request'

  resources :static_pages
  get 'principal_page' => 'static_pages#index'
  root 'static_pages#index'


  devise_for :users, :controllers => {
      registrations: 'registrations'
  }
end
