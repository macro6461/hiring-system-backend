class CreateTrainerLeadRsvpTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :trainer_lead_rsvp_tickets do |t|
       t.string :title
       t.string :date
       t.string :description
       t.string :location
       t.integer :trainer_lead_id
       t.integer :trainer_lead_rsvp_id
       t.integer :confirmation, default: nil
       t.integer :barcode, default: nil
       t.boolean :scanned, default: false
       t.integer :event_id

      t.timestamps
    end
  end
end
