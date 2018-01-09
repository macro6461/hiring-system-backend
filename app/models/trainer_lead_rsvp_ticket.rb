class TrainerLeadRsvpTicket < ApplicationRecord

  belongs_to :trainer_lead_rsvp
  has_many :trainer_lead, through: :trainer_lead_rsvp
  has_many :event, through: :trainer_lead_rsvp

  has_one_time_password

  after_save :change_scanned_for_parent_rsvp

  def change_scanned_for_parent_rsvp
    self.trainer_lead_rsvp.update(checked_in: self.scanned)
  end

  def generate_qr(text)

    require 'google-qr'

    chart = GoogleQR.new(:data => "#{text}", :size => "400x400", :margin => 4, :error_correction => "L")

    return chart.to_s

  end

end
