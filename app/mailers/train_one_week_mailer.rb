class TrainOneWeekMailer < ApplicationMailer

  default from: 'noreply@bohemiarealtygroup.com'
  include TrainerLeadRsvpTicketsHelper
  add_template_helper(TrainerLeadRsvpTicketsHelper)

  def train_one_week(ticket)

    @ticket = ticket
    @lead = ticket.trainer_lead[0]

    mail(to: @lead.email_address, subject: "The hiring event is tomorrow!")

  end


end
