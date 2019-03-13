Rails.application.routes.draw do
  resources :treatment_models
  resources :order_frequencies
  resources :admissions do
    resources :diagnoses
    resources :symptoms
    resources :observations
  end
  resources :patients do
    resources :chronic_conditions
    resources :alergies
    resources :diagnostic_procedures
    resources :treatments
    resources :medications
    resources :alergies
  end

  resources :emergency_transfer_summary, only: [:index]

  namespace :admin do
    resources :facilities do
      resources :template_fields
    end
  end
end
