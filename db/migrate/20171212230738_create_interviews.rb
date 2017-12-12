class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :title
      t.integer :trainer_id, default: nil
      t.string :date
      t.string :location
      t.integer :company_lead_id, default: nil
      t.integer :trainer_lead_id, default: nil

      t.timestamps
    end
  end
end
