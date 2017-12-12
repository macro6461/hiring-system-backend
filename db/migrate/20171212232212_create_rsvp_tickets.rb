class CreateRsvpTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvp_tickets do |t|
      t.string :title
      t.datetime :date
      t.string :description
      t.string :location
      t.integer :company_lead_id, default: nil
      t.integer :rsvp_id, default: nil
      t.integer :confirmation, default: nil
      t.integer :barcode, default: nil

      t.timestamps
    end
  end
end
