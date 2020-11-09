Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show] do
    delete '/patients/:patient_id', to: 'doctors/patients#destroy'
  end

  # resources :doctor_patients, only: [:delete]
  resources :hospitals, only: [:show]
end
