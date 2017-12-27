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
    byebug
    require 'barby'
    require 'barby/barcode'
    require 'barby/barcode/qr_code'
    require 'barby/outputter/png_outputter'

    barcode = Barby::QrCode.new(text, level: :q, size: 5)
    base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
    "data:image/png;base64,#{base64_output}"
    byebug
  end



end
