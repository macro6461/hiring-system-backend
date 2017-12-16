class CreateCompanyLeadRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :company_lead_rsvps do |t|
      t.string :title
      t.string :date
      t.string :description
      t.string :location
      t.integer :company_lead_id

      t.boolean :checked_in, default: false
      t.integer :event_id

      t.timestamps
    end
  end
end
