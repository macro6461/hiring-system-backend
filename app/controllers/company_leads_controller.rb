class CompanyLeadsController < ApplicationController

  def index
      @company_leads = CompanyLead.all
      render json: @company_leads
    end

    def show
      @company_lead = CompanyLead.find(params[:id])
      render json: @company_lead
    end

    def create
      byebug
      @company_lead = CompanyLead.where(:first_name=>company_lead_params[:first_name], :last_name=>company_lead_params[:last_name], :email_address=>company_lead_params[:email_address]).first_or_create do |company_lead|
        company_lead.phone_number = company_lead_params[:phone_number]
        company_lead.licensed = company_lead_params[:licensed]
        company_lead.trainer_purchased = company_lead_params[:trainer_purchased]
        company_lead.hire = company_lead_params[:hire]
      end
      if @company_lead.save
        render json: {company_lead: @company_lead}
      else
        render json: {error: @company_lead.errors.messages.first}, status: 406
      end
    end

    def update
      @company_lead = CompanyLead.find(params[:id])
      if @company_lead.update(company_lead_params)
        render json: @company_lead
      else
        render json: {error: @company_lead.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @company_lead = CompanyLead.find(params[:id])
      @company_lead.destroy
    end


    private

    def company_lead_params
      params.permit(:first_name, :last_name, :email_address, :phone_number, :licensed, :trainer_purchased, :hire)
    end

end
