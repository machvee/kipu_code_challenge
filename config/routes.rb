Rails.application.routes.draw do
  root to: "patient_searches#new"
  resources :patient_searches, only: [:new, :create]
  resources :patients, only: [:index] do
    resources :admissions, only: [:index]
  end
end
