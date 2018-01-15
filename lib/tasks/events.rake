
namespace :events do

  desc "update access event after 12 hours from date"
  task close: :environment do
    Event.where('end_date <= ?', Time.now).update(access: "closed")
  end

  desc "send appropriate emails after 12 hours"
  task email_after_twelve_hours: :environment do
    Event.where('end_date <= ?', Time.now-12.hours) do |event|
      company_attendees = event.company_lead_rsvps.where(checked_in: true)
      trainer_attendees = event.trainer_lead_rsvps.where(checked_in: true)
      company_absentees = event.company_lead_rsvps.where(checked_in: false)
      trainer_absentees = event.trainer_lead_rsvps.where(checked_in: false)
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
    end

  end

  desc "Send email one week before event"
  task send_email_one_week: :environment do

    Event.where('start_date <= ?', Time.now + 7.days)[0].company_lead_rsvps.map do |company_lead_rsvp|
      byebug
      @comp_ticket = company_lead_rsvp.company_lead_rsvp_ticket
      CompOneWeekMailer.with(comp_ticket: @comp_ticket).comp_one_week(@comp_ticket).deliver_now
    end

    Event.where('start_date <= ?', Time.now + 7.days)[0].trainer_lead_rsvps.map do |trainer_lead_rsvp|
      @train_ticket = trainer_lead_rsvp.trainer_lead_rsvp_ticket
      TrainOneWeekMailer.with(train_ticket: @train_ticket).train_one_week(@train_ticket).deliver_now
    end

  end

  desc "Send email 24 hours before event"
  task send_email_one_day: :environment do

    Event.where('start_date <= ?', Time.now + 24.hours)[0].company_lead_rsvps.map do |company_lead_rsvp|
      @comp_ticket = company_lead_rsvp.company_lead_rsvp_ticket
      byebug
      CompOneDayMailer.with(comp_ticket: @comp_ticket).comp_one_day(@comp_ticket).deliver_now
    end

    Event.where('start_date <= ?', Time.now + 24.hours)[0].trainer_lead_rsvps.map do |trainer_lead_rsvp|
      byebug
      @train_ticket = trainer_lead_rsvp.trainer_lead_rsvp_ticket
      TrainOneDayMailer.with(train_ticket: @train_ticket).train_one_day(@train_ticket).deliver_now
    end

  end


end
