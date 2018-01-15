class CreateRsvpReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvp_references do |t|
      t.integer :trainer_id
      t.integer :company_lead_rsvp_id
      t.timestamps
    end
  end
end
