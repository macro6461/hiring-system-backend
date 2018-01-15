class Event < ApplicationRecord
  # scope :active, -> { where('end_date >= :twelve_hours_ago', twelve_hours_ago: Time.now - 12.hours) }

  has_many :company_lead_rsvps
  has_many :trainer_lead_rsvps
  has_many :company_leads, through: :company_lead_rsvps
  has_many :trainer_leads, through: :trainer_lead_rsvps
  has_many :company_lead_rsvp_tickets, through: :company_lead_rsvps
  has_many :trainer_lead_rsvp_tickets, through: :company_lead_rsvps

  after_update :check_to_send_emails

  def check_to_send_emails
    if self.emails_sent == true
      return self
    else
      self.filter_emails_attendee_or_absentee
    end
  end

  def filter_emails_attendee_or_absentee
    if self.twelve_hours_later == true
      byebug
      company_attendees = self.company_lead_rsvps.where(checked_in: true)
      trainer_attendees = self.trainer_lead_rsvps.where(checked_in: true)
      company_absentees = self.company_lead_rsvps.where(checked_in: false)
      trainer_absentees = self.trainer_lead_rsvps.where(checked_in: false)

      #COMPANY ATTENDEES
      if company_attendees.length > 0
        company_attendees.map do |company_attendee|
          attendent_comp_lead = company_attendee.company_lead
              # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          ThankYouMailer.with(attendent_comp_lead: attendent_comp_lead).thank_you(attendent_comp_lead).deliver_now
        end
      end

      #TRAINER ATTENDEES
      if trainer_attendees.length > 0
        trainer_attendees.map do |trainer_attendee|
          attendent_train_lead = trainer_attendee.trainer_lead
              # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          ThankYouMailer.with(attendent_train_lead: attendent_train_lead).thank_you(attendent_train_lead).deliver_now
        end
      end

      #COMPANY ABSENTEES
      if company_absentees.length > 0
        company_absentees.map do |company_absentee|
          absent_comp_lead = company_absentee.company_lead
              # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          SorryMailer.with(absent_comp_lead: absent_comp_lead).sorry(absent_comp_lead).deliver_now
        end
      end

      #TRAINER ABSENTEES
      if trainer_absentees.length > 0
        trainer_absentees.map do |trainer_absentee|
          absent_train_lead = trainer_absentee.trainer_lead
              # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          SorryMailer.with(absent_train_lead: absent_train_lead).sorry(absent_train_lead).deliver_now
        end
      end
      self.update(emails_sent: true)
    else
      byebug
      return self
    end
  end

end
