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

      if params[:otp_secret_key].length > 0
        @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.where(:otp_secret_key=>params[:otp_secret_key]).first
      elsif params[:first_name].length > 0 && params[:last_name].length > 0
        @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.where(:company_lead_id=>@company_lead.id).first
      elsif params[:confirmation].length > 0
        @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.where(:confirmation=>params[:confirmation]).first
      end
      
      if @company_lead_rsvp_ticket
        render json: {lead: @company_lead_rsvp_ticket.company_lead, ticket: @company_lead_rsvp_ticket}
      else
        render json: {error: "RSVP not found"}
      end
    end

    def update

      @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.find(params[:id])
      if @company_lead_rsvp_ticket.update(scanned: params[:scanned])
        render json: {company_lead_rsvp_ticket: @company_lead_rsvp_ticket}
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
      params.permit(:first_name, :last_name, :otp_secret_key, :title, :date, :description, :location, :company_lead_id, :company_lead_rsvp_id, :confirmation, :barcode, :scanned)
    end

end
