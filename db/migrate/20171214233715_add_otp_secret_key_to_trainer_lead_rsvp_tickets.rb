class AddOtpSecretKeyToTrainerLeadRsvpTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :trainer_lead_rsvp_tickets, :otp_secret_key, :string
  end
end
