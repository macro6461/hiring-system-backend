Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers
  resources :company_lead_interviews
  resources :company_lead_rsvps
  resources :trainer_lead_interviews
  resources :trainer_lead_rsvps
  resources :company_leads
  resources :trainer_leads
  resources :company_lead_rsvp_tickets
  resources :trainer_lead_rsvp_tickets
  resources :events
end
