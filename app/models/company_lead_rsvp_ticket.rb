class CompanyLeadRsvpTicket < ApplicationRecord

  belongs_to :company_lead_rsvp
  has_many :company_lead, through: :company_lead_rsvp
  has_many :event, through: :company_lead_rsvp

  has_one_time_password

  after_save :change_scanned_for_parent_rsvp

  def change_scanned_for_parent_rsvp
    self.company_lead_rsvp.update(checked_in: self.scanned)
  end

  def generate_qr(text)

    require 'google-qr'

    chart = GoogleQR.new(:data => "#{text}", :size => "500x500", :margin => 4, :error_correction => "L")

    return chart.to_s

  end

end
