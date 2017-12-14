Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers
  resources :interviews
  resources :company_leads
  resources :trainer_leads
  resources :rsvps
  resources :rsvp_tickets
end
