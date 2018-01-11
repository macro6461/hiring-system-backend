class TrainerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email_address, :phone_number, :url, :occupied, :hold

  has_many :trainer_leads
end

t.string :first_name
t.string :last_name
t.string :email_address
t.string :phone_number
t.string :url
t.boolean :occupied, default: false
t.boolean :hold, default: false
