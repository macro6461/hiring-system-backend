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
      byebug
      @company_lead_rsvp = CompanyLeadRsvp.new(company_lead_rsvp_params)
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
      params.permit(:title, :date, :description, :location, :company_lead_id, :event_id, :checked_in)
    end

end
