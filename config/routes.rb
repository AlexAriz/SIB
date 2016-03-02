Rails.application.routes.draw do

  mount Commontator::Engine => '/commontator'

  resources :users_work_materials
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

  get 'tutors/cancel_tutorng/:id/:candidate_id' => 'tutors#cancel_tutoring', as: 'cancel_tutoring'

  resources :universities
  get 'university/index'

  resources :work_materials

  get 'users/index'
  get 'users/show/:id' => 'users#show', as: 'user_show'
  get 'users/edit/:id' => 'users#edit', as: 'user_edit'
  get 'work_materials/assign/:id' => 'work_materials#assign', as: 'work_material_assign'
  patch 'users/edit/:id' => 'users#update'
  put 'users/edit/:id' => 'users#update'
  put 'work_materials/assign/:id' => 'work_materials#update'
  patch 'work_materials/update_assign_work_material/:id' =>
          'work_materials#update_assign_work_material', as: 'update_assign_work_material'

  delete 'users/destroy/:id' => 'users#destroy', as: 'user_destroy'

  resources :scholarships
  get 'scholarships/read_request/:id', to: 'scholarships#read_request', as:
      'request_scholarship'

  resources :static_pages
  get 'principal_page' => 'static_pages#index'
  root 'static_pages#index'


  devise_for :users, :controllers => {
      registrations: 'registrations'
  }
end
