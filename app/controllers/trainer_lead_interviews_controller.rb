class TrainerLeadInterviewsController < ApplicationController

  def index
      @trainer_lead_interviews = TrainerLeadInterview.all
      render json: @trainer_lead_interviews
    end

    def show
      @trainer_lead_interview = TrainerLeadInterview.find(params[:id])
      render json: @trainer_lead_interview
    end

    def create
      @free_trainers = Trainer.all.where(:occupied=>false, :hold=>false).sort_by(&:updated_at)
      @first_free_trainer = @free_trainers.first
      if !trainer_lead_interview_params[:trainer_lead_id]
        byebug
        @trainer_lead = TrainerLead.where(:first_name=>trainer_lead_interview_params[:first_name], :last_name=>trainer_lead_interview_params[:last_name], email_address: trainer_lead_interview_params[:email_address]).first_or_create do |trainer_lead|
          trainer_lead.first_name = trainer_lead_interview_params[:first_name]
          trainer_lead.last_name = trainer_lead_interview_params[:last_name]
          trainer_lead.email_address = trainer_lead_interview_params[:email_address]
          trainer_lead.phone_number = trainer_lead_interview_params[:phone_number]
          trainer_lead.licensed = trainer_lead_interview_params[:licensed]
        end
        byebug
        @title = "#{@trainer_lead.first_name} #{@trainer_lead.last_name} interview with #{@first_free_trainer.first_name} #{@first_free_trainer.last_name}"
        @trainer_lead_interview = TrainerLeadInterview.new(trainer_id: @first_free_trainer.id, title: @title, date: trainer_lead_interview_params[:date], location: "Bohemia Realty Group, 2101 Frederick Douglass Boulevard, New York, NY 10026", trainer_lead_id: @trainer_lead.id)
      if @trainer_lead_interview.save
        render json: {trainer_lead_interview: @trainer_lead_interview}
      else
        render json: {error: @trainer_lead_interview.errors.messages.first}, status: 406
      end
    end

    def update
      @trainer_lead_interview = TrainerLeadInterview.find(params[:id])
      if @trainer_lead_interview.update(trainer_lead_interview_params)
        render json: @trainer_lead_interview
      else
        render json: {error: @trainer_lead_interview.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @trainer_lead_interview = TrainerLeadInterview.find(params[:id])
      @trainer_lead_interview.destroy
    end


    private

    def trainer_lead_interview_params
      params.permit(:title, :trainer_id, :date, :location, :trainer_lead_id, :notes, :email_address, :first_name, :last_name, :phone_number, :licensed)
    end

end
