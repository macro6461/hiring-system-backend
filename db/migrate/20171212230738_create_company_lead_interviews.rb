class CreateCompanyLeadInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :title
      t.integer :trainer_id
      t.datetime :date
      t.string :location
      t.integer :company_lead_id
      t.text :notes, default: nil
      t.string :hire, default: "N/A"

      t.timestamps
    end
  end
end
