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
      byebug
      @trainer_lead_interview = TrainerLeadInterview.new(trainer_lead_interview_params)
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
      params.permit(:title, :trainer_id, :date, :location, :company_lead_id, :notes, :trainer_lead_id)
    end

end
