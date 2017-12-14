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
      byebug
      @company_lead_interview = CompanyLeadInterview.new(company_lead_interview_params)
      if @company_lead_interview.save
        render json: {company_lead_interview: @company_lead_interview}
      else
        render json: {error: @company_lead_interview.errors.messages.first}, status: 406
      end
    end

    def update
      @company_lead_interview = CompanyLeadInterview.find(params[:id])
      if @company_lead_interview.update(company_lead_interview_params)
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
      params.permit(:title, :trainer_id, :date, :location, :company_lead_id, :notes)
    end

end
