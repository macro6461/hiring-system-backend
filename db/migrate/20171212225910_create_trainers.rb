class CreateTrainers < ActiveRecord::Migration[5.1]
  def change
    create_table :trainers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.string :url
      t.boolean :occupied, default: false
      t.boolean :hold, default: false

      t.timestamps
    end
  end
end
