class CompanyLeadRsvpTicketsController < ApplicationController

  def index
      @company_lead_rsvp_tickets = CompanyLeadRsvpTicket.all
      render json: @company_lead_rsvp_tickets
    end

    def show
      @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.find(params[:id])
      @qr = RQRCode::QRCode.new(@company_lead_rsvp_ticket.provisioning_uri("hiring-system-backend"), :size => 7, :level => :h )
      render json: @company_lead_rsvp_ticket
    end

    def create

      @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.new(company_lead_rsvp_ticket_params)
      if @company_lead_rsvp_ticket.save
        render json: {company_lead_rsvp_ticket: @company_lead_rsvp_ticket}
      else
        render json: {error: @company_lead_rsvp_ticket.errors.messages.first}, status: 406
      end
    end

    def update
      @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.find(params[:id])
      if @company_lead_rsvp_ticket.update(company_lead_rsvp_ticket_params)
        render json: @company_lead_rsvp_ticket
      else
        render json: {error: @company_lead_rsvp_ticket.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.find(params[:id])
      @company_lead_rsvp_ticket.destroy
    end


    private

    def company_lead_rsvp_ticket_params
      params.permit(:title, :date, :description, :location, :company_lead_id, :company_lead_rsvp_id, :confirmation, :barcode, :scanned)
    end

end
