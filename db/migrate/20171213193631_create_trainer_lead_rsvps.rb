class CreateTrainerLeadRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :trainer_lead_rsvps do |t|
      t.string :title
      t.datetime :date
      t.string :description
      t.string :location
      t.integer :trainer_lead_id
      t.integer :event_id
      t.boolean :checked_in, default: false
      t.timestamps
    end
  end
end
