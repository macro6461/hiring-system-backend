class CompanyLeadRsvpsController < ApplicationController

  def index
      @company_lead_rsvps = CompanyLeadRsvp.all.sort_by(&:event_id)
      render json: @company_lead_rsvps
    end

    def show
      @company_lead_rsvp = CompanyLeadRsvp.find(params[:id])
      render json: @company_lead_rsvp
    end

    def create
      if !company_lead_rsvp_params[:company_lead_id]
        @company_lead = CompanyLead.where(:first_name=>company_lead_rsvp_params[:first_name], :last_name=>company_lead_rsvp_params[:last_name], email_address: company_lead_rsvp_params[:email_address]).first_or_create do |company_lead|
          company_lead.first_name = company_lead_rsvp_params[:first_name]
          company_lead.last_name = company_lead_rsvp_params[:last_name]
          company_lead.email_address = company_lead_rsvp_params[:email_address]
          company_lead.phone_number = company_lead_rsvp_params[:phone_number]
          company_lead.licensed = company_lead_rsvp_params[:licensed]
        end
        @event = Event.find_by(title: company_lead_rsvp_params[:event_title])
        byebug
        @company_lead_rsvp = CompanyLeadRsvp.where(:company_lead_id=>@company_lead.id, :event_id=>@event.id).first_or_create do |company_lead_rsvp|

          company_lead_rsvp.title = @event.title
          company_lead_rsvp.date = @event.date
          company_lead_rsvp.location = @event.location
          company_lead_rsvp.company_lead_id= @company_lead.id
        end
      end
      if @company_lead_rsvp.save
        render json: {company_lead_rsvp: @company_lead_rsvp}
      else
        render json: {error: @company_lead_rsvp.errors.messages.first}, status: 406
      end
    end

    def update
      @company_lead_rsvp = CompanyLeadRsvp.find(params[:id])
      if @company_lead_rsvp.update(company_lead_rsvp_params)
        render json: @company_lead_rsvp
      else
        render json: {error: @company_lead_rsvp.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @company_lead_rsvp = CompanyLeadRsvp.find(params[:id])
      @company_lead_rsvp.destroy
    end


    private

    def company_lead_rsvp_params
      params.permit(:title, :event_title, :date, :description, :location, :company_lead_id, :email_address, :first_name, :last_name, :phone_number, :licensed, :event_id)
    end

end
