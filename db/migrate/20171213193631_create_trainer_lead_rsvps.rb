class CreateTrainerLeadRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :trainer_lead_rsvps do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :description, default: nil
      t.string :location
      t.integer :trainer_lead_id
      t.integer :event_id, default: nil
      t.integer :trainer_id, default: nil
      t.boolean :checked_in, default: false

      t.timestamps
    end
  end
end
