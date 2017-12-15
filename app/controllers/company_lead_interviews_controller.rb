class CompanyLeadInterviewsController < ApplicationController

  def index
      @company_lead_interviews = CompanyLeadInterview.all
      render json: @company_lead_interviews
    end

    def show
      @company_lead_interview = CompanyLeadInterview.find(params[:id])
      render json: @company_lead_interview
    end

    def create

      let @company_lead_found = CompanyLead.wherePermission.where(:first_name=>company_lead_interview_params[:first_name]).where(:last_name=>company_lead_interview_params[:last_name], email_address: company_lead_interview_params[:email_address]).first

      if !company_lead_interview_params[:company_lead_id]
        if !@company_lead_found
          @company_lead = CompanyLead.create(first_name: company_lead_interview_params[:first_name], last_name: company_lead_interview_params[:last_name], email_address: company_lead_interview_params[:email_address], phone_number: company_lead_interview_params[:phone_number], licensed: company_lead_interview_params[:licensed])

          @company_lead_interview = CompanyLeadInterview.new(title: company_lead_interview_params[:title], trainer_id: company_lead_interview_params[:trainer_id], date: company_lead_interview_params[:date], location: company_lead_interview_params[:location], company_lead_id: @company_lead.id)

        elsif @company_lead_found
          @company_lead_interview = CompanyLeadInterview.new(title: company_lead_interview_params[:title], trainer_id: company_lead_interview_params[:trainer_id], date: company_lead_interview_params[:date], location: company_lead_interview_params[:location], company_lead_id: @company_lead_found.id)
        end
      end

      if @company_lead_interview.save
        render json: {company_lead_interview: @company_lead_interview}
      else
        render json: {error: @company_lead_interview.errors.messages.first}, status: 406
      end
    end

    def update
      @company_lead_interview = CompanyLeadInterview.find(params[:id])
      if @company_lead_interview.update(title: company_lead_interview_params[:title], trainer_id: company_lead_interview_params[:trainer_id], date: company_lead_interview_params[:date], location: company_lead_interview_params[:location], company_lead_id: company_lead_interview_params[:company_lead_id])
        render json: @company_lead_interview
      else
        render json: {error: @company_lead_interview.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @company_lead_interview = CompanyLeadInterview.find(params[:id])
      @company_lead_interview.destroy
    end


    private

    def company_lead_interview_params
      params.permit(:title, :trainer_id, :date, :location, :company_lead_id, :notes, :email_address, :first_name, :last_name, :phone_number, :licensed)
    end

end
