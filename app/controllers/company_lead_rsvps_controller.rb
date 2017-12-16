class CompanyLeadRsvpsController < ApplicationController

  def index
      @company_lead_rsvps = CompanyLeadRsvp.all
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

        @company_lead_rsvp = CompanyLeadInterview.new(title: company_lead_rsvp_params[:title], trainer_id: company_lead_rsvp_params[:trainer_id], date: company_lead_rsvp_params[:date], location: company_lead_rsvp_params[:location], company_lead_id: @company_lead.id)
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
      params.permit(:title, :date, :description :location, :company_lead_id, :email_address, :first_name, :last_name, :phone_number, :licensed, :event_id)
    end

end
