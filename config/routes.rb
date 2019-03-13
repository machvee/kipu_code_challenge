Rails.application.routes.draw do
  resources :patients, only: [:index] do
    resources :emergency_transfer_summary, only: [:show]
  end
end
