class CreateInterviewReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :interview_references do |t|
      t.integer :trainer_id
      t.integer :company_lead_interview_id
      t.timestamps
    end
  end
end
