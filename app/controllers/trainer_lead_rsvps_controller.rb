class TrainerLeadRsvpsController < ApplicationController

  def index
      @trainer_lead_rsvps = TrainerLeadRsvp.all
      render json: @trainer_lead_rsvps
    end

    def show
      @trainer_lead_rsvp = TrainerLeadRsvp.find(params[:id])
      render json: @trainer_lead_rsvp
    end

    def create

      @trainer_lead_rsvp = TrainerLeadRsvp.new(trainer_lead_rsvp_params)
      if @trainer_lead_rsvp.save
        render json: {trainer_lead_rsvp: @trainer_lead_rsvp}
      else
        render json: {error: @trainer_lead_rsvp.errors.messages.first}, status: 406
      end
    end

    def update
      @trainer_lead_rsvp = TrainerLeadRsvp.find(params[:id])
      if @trainer_lead_rsvp.update(trainer_lead_rsvp_params)
        render json: @trainer_lead_rsvp
      else
        render json: {error: @trainer_lead_rsvp.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @trainer_lead_rsvp = TrainerLeadRsvp.find(params[:id])
      @trainer_lead_rsvp.destroy
    end


    private

    def trainer_lead_rsvp_params
      params.permit(:title, :date, :description, :location, :trainer_lead_id, :event_id, :checked_in)
    end

end
