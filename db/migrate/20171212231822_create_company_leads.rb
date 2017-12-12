class CreateCompanyLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :company_leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.boolean :licensed, default: false
      t.integer :rsvp_id, default: nil
      t.integer :interview_id, default: nil
      t.boolean :trainer_purchased, default: false

      t.timestamps
    end
  end
end
