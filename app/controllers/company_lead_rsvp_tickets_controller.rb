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
      byebug
      @company_lead = CompanyLead.where(:first_name=>params[:first_name], :last_name=>params[:last_name]).first
      @company_lead_rsvp_ticket = CompanyLeadRsvpTicket.where(:otp_secret_key=>params[:otp_secret_key]).first || CompanyLeadRsvpTicket.where(:company_lead_id=>@company_lead.id).first
      respond_to do |format|
        if @company_lead_rsvp_ticket.save
        byebug
          # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
          CompanyLeadRsvpTicketMailer.with(company_lead_rsvp_ticket: @company_lead_rsvp_ticket).company_lead_rsvp_ticket(@company_lead_rsvp_ticket).deliver_now

          format.html { redirect_to(@company_lead_rsvp_ticket, notice: 'Company Lead RSVP Ticket was successfully created.') }
          format.json { render json: @company_lead_rsvp_ticket, status: :created, location: @company_lead_rsvp_ticket }

          # render json: {company_lead_rsvp_ticket: @company_lead_rsvp_ticket}
        else
          format.html { render action: 'new' }
          format.json { render json: @company_lead_rsvp_ticket.errors, status: :unprocessable_entity }

          render json: {error: @company_lead_rsvp_ticket.errors.messages.first}, status: 406
        end
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
