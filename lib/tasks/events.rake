
namespace :events do

  desc "Delete event after 12 hours from date"
  task delete_12_hours_old: :environment do
    Event.where('end_date <= ?', Time.now-12.hours).destroy_all
  end

  desc "Send email one week before event"
  task send_email_one_week: :environment do

    Event.where('start_date <= ?', Time.now-7.days).company_lead_rsvps.map do |company_lead_rsvp|
      @company_lead = company_lead_rsvp.company_lead
      OneWeekMailer.with(company_lead: @company_lead).one_week(company_lead).deliver_now
    end

    Event.where('start_date <= ?', Time.now-7.days).trainer_lead_rsvps.map do |trainer_lead_rsvp|
      @trainer_lead = trainer_lead_rsvp.trainer_lead
      OneWeekMailer.with(trainer_lead: @trainer_lead).one_week(trainer_lead).deliver_now
    end

  end

  desc "Send email 24 hours before event"
  task send_email_one_day: :environment do

    Event.where('start_date <= ?', Time.now-1.day).company_lead_rsvps.map do |company_lead_rsvp|
      @company_lead = company_lead_rsvp.company_lead
      OneDayMailer.with(company_lead: @company_lead).one_week(company_lead).deliver_now
    end

    Event.where('start_date <= ?', Time.now-1.day).trainer_lead_rsvps.map do |trainer_lead_rsvp|
      @trainer_lead = trainer_lead_rsvp.trainer_lead
      OneDayMailer.with(trainer_lead: @trainer_lead).one_day(trainer_lead).deliver_now
    end

  end


end
