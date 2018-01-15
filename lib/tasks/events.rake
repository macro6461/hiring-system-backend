
namespace :events do

  desc "update access event after 12 hours from date"
  task close: :environment do
    Event.where('end_date <= ?', Time.now).update(access: "closed")
  end

  desc "send appropriate emails after 12 hours"
  task email_after_twelve_hours: :environment do
    Event.where('end_date <= ?', Time.now-12.hours).last.update(twelve_hours_later: true)
  end

  desc "Send email one week before event"
  task send_email_one_week: :environment do

    Event.where('start_date <= ?', Time.now + 7.days)[0].company_lead_rsvps.map do |company_lead_rsvp|
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
