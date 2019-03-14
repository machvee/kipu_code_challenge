Rails.application.routes.draw do
  resources :patient_searches, only: [:new, :create]
  resources :patients, only: [:index] do
    resources :admissions, only: [:index]
  end
end
