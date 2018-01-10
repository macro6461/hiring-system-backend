class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
       t.string :title
       t.datetime :start_date
       t.datetime :end_date
       t.text :description
       t.string :location

       t.timestamps
    end
  end
end
