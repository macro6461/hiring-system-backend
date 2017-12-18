class TrainerLeadsController < ApplicationController

  def index
      @trainer_leads = TrainerLead.all
      render json: @trainer_leads
    end

    def show
      @trainer_lead = TrainerLead.find(params[:id])
      render json: @trainer_lead
    end

    def create

      @trainer_lead = TrainerLead.new(trainer_lead_params)
      if @trainer_lead.save
        render json: {trainer_lead: @trainer_lead}
      else
        render json: {error: @trainer_lead.errors.messages.first}, status: 406
      end
    end

    def update
      @trainer_lead = TrainerLead.find(params[:id])
      if @trainer_lead.update(trainer_lead_params)
        render json: @trainer_lead
      else
        render json: {error: @trainer_lead.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @trainer_lead = TrainerLead.find(params[:id])
      @trainer_lead.destroy
    end


    private

    def trainer_lead_params
      params.permit(:first_name, :last_name, :email_address, :phone_number, :trainer_id, :licensed, :company_purchased, :hire)
    end

end
