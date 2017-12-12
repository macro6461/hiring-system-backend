class CreateRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvps do |t|
      t.string :title
      t.string :date
      t.string :description
      t.string :location
      t.integer :company_lead_id, default: nil
      t.integer :trainer_lead_id, default: nil
      t.string :checked_in, default: false

      t.timestamps
    end
  end
end
