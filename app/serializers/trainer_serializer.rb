class TrainerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email_address, :phone_number, :url, :occupied, :hold

  has_many :trainer_leads
end
