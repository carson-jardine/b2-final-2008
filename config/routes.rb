Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #doctors
  get '/doctors/:id', to: 'doctors#show'
  delete '/doctors/:id/patients/:patient_id', to: 'doctor_patients#destroy'
  # resources :doctors, only: [:show] do
    # delete '/patients/:patient_id', to: 'doctors/patients#destroy'
  # end

  # resources :doctor_patients, only: [:delete]
  resources :hospitals, only: [:show]
end
