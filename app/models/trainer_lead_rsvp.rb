class TrainerLeadRsvp < ApplicationRecord

  belongs_to :trainer_lead
  belongs_to :event
  has_one :trainer_lead_rsvp_ticket

  # after_initialize :init_trainer_lead_rsvp_ticket
  after_save :create_or_destroy_trainer_lead_rsvp_ticket

  def create_or_destroy_trainer_lead_rsvp_ticket
    # when trainer lead checks in (changes value of trainer_lead_rsvp.checked_in to true) destroy ticket (barcode can't be scanned)
    if !self.checked_in
      rsvp_ticket = TrainerLeadRsvpTicket.where(:trainer_lead_id=>self.trainer_lead_id, :event_id=>self.event_id).first_or_create do |ticket|

        ticket.title = self.title
        ticket.date = self.date
        ticket.description = self.description
        ticket.location = self.location
        ticket.trainer_lead_rsvp_id = self.id
        ticket.confirmation = (20 + Random.rand(11100000))
        ticket.scanned = self.checked_in
      end
      # rsvp_ticket.update(barcode: (RQRCode::QRCode.new(rsvp_ticket.provisioning_uri("hiring-system-backend"), :size => 7, :level => :h )))
    elsif self.checked_in
      self.trainer_lead_rsvp_ticket.destroy()
    end
  end

end
