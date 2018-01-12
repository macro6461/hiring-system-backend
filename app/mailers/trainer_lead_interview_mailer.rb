class TrainerLeadInterviewMailer < ApplicationMailer

    default from: 'noreply@bohemiarealtygroup.com'
    include TrainerLeadInterviewsHelper
    add_template_helper(TrainerLeadInterviewsHelper)

    def trainer_lead_interview(trainer_lead_interview)
      byebug
      @trainer_lead_interview = trainer_lead_interview
      @trainer = Trainer.find(@trainer_lead_interview.trainer_id)
      @trainer_lead = @trainer_lead_interview.trainer_lead
      @full_name = full_name(@trainer)

      mail(:to => @trainer_lead.email_address, :subject => "#{@trainer_lead.first_name}'s Interview With #{@full_name}")


    end


end
