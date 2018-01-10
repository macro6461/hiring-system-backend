class Event < ApplicationRecord
  # scope :active, -> { where('end_date >= :twelve_hours_ago', twelve_hours_ago: Time.now - 12.hours) }

  has_many :company_lead_rsvps
  has_many :trainer_lead_rsvps
  has_many :company_leads, through: :company_lead_rsvps
  has_many :trainer_leads, through: :trainer_lead_rsvps
  has_many :company_lead_rsvp_tickets, through: :company_lead_rsvps
  has_many :trainer_lead_rsvp_tickets, through: :company_lead_rsvps

  before_destroy :filter_emails_attendee_or_absentee

  def filter_emails_attendee_or_absentee

    attendees = self.company_lead_rsvps.where(checked_in: true)
    absentees = self.company_lead_rsvps.where(checked_in: false)

    attendees.map do |attendee|
      byebug
      attendent_lead = attendee.company_lead
          # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          ThankYouMailer.with(attendent_lead: attendent_lead).thank_you(attendent_lead).deliver_now
          # render json: {company_lead: @company_lead}

      end

    absentees.map do |absentee|
      byebug
      absent_lead = absentee.company_lead
          # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          SorryMailer.with(absentee: absent_lead).sorry(absent_lead).deliver_now

          # render json: {company_lead: @company_lead}

      end

  end

end
