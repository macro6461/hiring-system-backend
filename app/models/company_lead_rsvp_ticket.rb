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
    require 'barby'
    require 'barby/barcode'
    require 'barby/barcode/qr_code'
    require 'barby/outputter/png_outputter'

    chart = GoogleQR.new(:data => "#{text}", :size => "500x500", :margin => 4, :error_correction => "L")
    byebug
    return chart.to_s
    # chart.render
    # full_path = "public/barcodes/barcode_#{text}.png"
    # barcode = Barby::QrCode.new(text, level: :q, size: 5)
    # # base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
    # File.open(full_path, 'wb') { |f| f.write barcode.to_png(:margin => 3, :xdim => 2, :height => 55) }
    # # full_path = "data:image/png;base64,#{base64_output}"
    # return full_path

    # full_path =
    # barcode = Barby::Code64.new(barcode_value)
    # File.open(full_path, 'w') { |f| f.write barcode.to_png(:margin => 3, :xdim => 2, :height => 55) }

  end



end
