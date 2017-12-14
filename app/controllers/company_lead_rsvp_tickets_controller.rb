class CompanyLeadRsvpTicketsController < ApplicationController

  def index
      @company_lead_tickets = CompanyLeadRsvpTicket.all
      render json: @company_lead_tickets
    end

    def show
      @company_lead_ticket = CompanyLeadRsvpTicket.find(params[:id])
      render json: @company_lead_ticket
    end

    def create
      byebug
      @company_lead_ticket = CompanyLeadRsvpTicket.new(company_lead_ticket_params)
      if @company_lead_ticket.save
        render json: {company_lead_ticket: @company_lead_ticket}
      else
        render json: {error: @company_lead_ticket.errors.messages.first}, status: 406
      end
    end

    def update
      @company_lead_ticket = CompanyLeadRsvpTicket.find(params[:id])
      if @company_lead_ticket.update(company_lead_ticket_params)
        render json: @company_lead_ticket
      else
        render json: {error: @company_lead_ticket.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @company_lead_ticket = CompanyLeadRsvpTicket.find(params[:id])
      @company_lead_ticket.destroy
    end


    private

    def company_lead_ticket_params
      params.permit(:title, :date, :description, :location, :company_lead_id, :company_lead_rsvp_id, :confirmation, :barcode)
    end

end
