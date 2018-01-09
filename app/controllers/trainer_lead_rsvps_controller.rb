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
      if !trainer_lead_rsvp_params[:trainer_lead_id]
        @trainer_lead = TrainerLead.where(:first_name=>trainer_lead_rsvp_params[:first_name], :last_name=>trainer_lead_rsvp_params[:last_name], email_address: trainer_lead_rsvp_params[:email_address]).first_or_create do |trainer_lead|
          byebug
          trainer_lead.first_name = trainer_lead_rsvp_params[:first_name]
          trainer_lead.last_name = trainer_lead_rsvp_params[:last_name]
          trainer_lead.email_address = trainer_lead_rsvp_params[:email_address]
          trainer_lead.phone_number = trainer_lead_rsvp_params[:phone_number]
          trainer_lead.licensed = trainer_lead_rsvp_params[:licensed]
        end
        @event = Event.find_by(title: trainer_lead_rsvp_params[:event_title])
        
        @trainer_lead_rsvp = TrainerLeadRsvp.where(:trainer_lead_id=>@trainer_lead.id, :event_id=>@event.id).first_or_create do |trainer_lead_rsvp|
          trainer_lead_rsvp.title = @event.title
          trainer_lead_rsvp.date = @event.date
          trainer_lead_rsvp.location = @event.location
          trainer_lead_rsvp.trainer_lead_id= @trainer_lead.id
        end
      end
      if @trainer_lead_rsvp.save
        @trainer_lead_rsvp_ticket = @trainer_lead_rsvp.trainer_lead_rsvp_ticket
        respond_to do |format|
          if  @trainer_lead_rsvp_ticket.save
            # Tell the CompanyLeadRsvpTicketMailer to send an email after save containing the ticket
            TrainerLeadRsvpTicketMailer.with(trainer_lead_rsvp_ticket: @trainer_lead_rsvp_ticket).trainer_lead_rsvp_ticket(@trainer_lead_rsvp_ticket).deliver_now
            format.html
            format.json
            # render json: {trainer_lead: @trainer_lead}
          else
            format.html
            format.json
          end
        end
        render json: {trainer_lead_rsvp: @trainer_lead_rsvp, trainer_lead_rsvp_ticket: @trainer_lead_rsvp_ticket}
      else
        render json: {error: [@trainer_lead_rsvp.errors.messages.first, @trainer_lead_rsvp_ticket.errors.messages.first]}, status: 406
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
      params.permit(:email_address, :first_name, :last_name, :phone_number, :licensed, :trainer_id, :title, :date, :description, :location, :trainer_lead_id, :event_id, :checked_in, :event_title,  :trainer_lead_rsvp=>{})
    end

end
