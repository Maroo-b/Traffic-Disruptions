Rails.application.routes.draw do
  resource :disruption, only: [:show]
  root 'maps#show'
end
