class AddOtpSecretKeyToCompanyLeadRsvpTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :company_lead_rsvp_tickets, :otp_secret_key, :string
  end
end
