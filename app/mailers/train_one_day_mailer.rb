class TrainOneDayMailer < ApplicationMailer

  def train_one_day(ticket)
    byebug
      @ticket = ticket
      @lead = ticket.trainer_lead[0]
      mail(to: @lead.email_address, subject: "The hiring event is tomorrow!")

  end

end
