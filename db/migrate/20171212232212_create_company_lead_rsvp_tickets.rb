class CreateCompanyLeadRsvpTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :company_lead_rsvp_tickets do |t|
       t.string :title
       t.string :date
       t.string :description
       t.string :location
       t.integer :company_lead_id
       t.integer :company_lead_rsvp_id
       t.integer :confirmation, default: nil

       t.boolean :scanned, default: false

       t.timestamps
    end
  end
end
