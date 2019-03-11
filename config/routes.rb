Rails.application.routes.draw do
  resources :template_fields
  resources :treatment_models
  resources :diagnostic_procedures
  resources :order_frequencies
  resources :medication_orders
  resources :alergies
  resources :observations
  resources :symptoms
  resources :diagnoses
  resources :admissions
  resources :patients
  resources :facilities
  resources :emergency_transfer_summary, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
