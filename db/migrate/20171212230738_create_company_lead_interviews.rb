class CreateCompanyLeadInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :company_lead_interviews do |t|
      t.string :title, default: nil
      t.integer :trainer_id, default: nil
      t.string :date, default: nil
      t.string :location, default: nil
      t.integer :company_lead_id
      t.text :notes, default: nil
      t.string :hire, default: "N/A"

      t.timestamps
    end
  end
end
