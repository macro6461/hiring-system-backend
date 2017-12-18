class TrainerLeadRsvpTicketsController < ApplicationController

  def index
      @trainer_lead_tickets = TrainerLeadRsvpTicket.all
      render json: @trainer_lead_tickets
    end

    def show
      @trainer_lead_rsvp_ticket = TrainerLeadRsvpTicket.find(params[:id])
      @qr = RQRCode::QRCode.new(@trainer_lead_rsvp_ticket.provisioning_uri("hiring-system-backend"), :size => 7, :level => :h )
      render json: @trainer_lead_rsvp_ticket
    end

    def create

      @trainer_lead_ticket = TrainerLeadRsvpTicket.new(trainer_lead_ticket_params)
      if @trainer_lead_ticket.save
        render json: {trainer_lead_ticket: @trainer_lead_ticket}
      else
        render json: {error: @trainer_lead_ticket.errors.messages.first}, status: 406
      end
    end

    def update
      @trainer_lead_ticket = TrainerLeadRsvpTicket.find(params[:id])
      if @trainer_lead_ticket.update(trainer_lead_ticket_params)
        render json: @trainer_lead_ticket
      else
        render json: {error: @trainer_lead_ticket.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @trainer_lead_ticket = TrainerLeadRsvpTicket.find(params[:id])
      @trainer_lead_ticket.destroy
    end


    private

    def trainer_lead_ticket_params
      params.permit(:title, :date, :description, :location, :trainer_lead_id, :trainer_lead_rsvp_id, :confirmation, :barcode, :scanned)
    end

end
