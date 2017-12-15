class CompanyLead < ApplicationRecord

  has_many :company_lead_rsvps
  has_many :events, through: :company_lead_rsvps
  has_many :company_lead_rsvp_tickets, through: :company_lead_rsvps
  has_many :company_lead_interviews

  def hired
    byebug
    if self.company_lead_interviews[0] == nil
      return "N/A"
    else
      if self.company_lead_interviews[0].hire == "N/A"
        return "N/A"
      else
        return self.update(hire: self.company_lead_interviews[0].hire)
      end
    end
    return self.hire
  end

end
