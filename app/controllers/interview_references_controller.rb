class InterviewReferencesController < ApplicationController
  def index
      @interview_references = InterviewReference.all
      render json: @interview_references
    end

    def show
      @interview_reference = InterviewReference.find(params[:id])
      render json: @interview_reference
    end

    def create
      @interview_reference = InterviewReference.new(company_lead_interview_id: params[:company_lead_interview_id], trainer_id: params[:trainer_id])
      if @interview_reference.save
        render json: {interview_reference: @interview_reference}
      else
        render json: {error: @interview_reference.errors.messages.first}, status: 406
      end
    end

    def update
      @interview_reference = InterviewReference.find(params[:id])
      if @interview_reference.update(interview_reference_params)
        render json: @interview_reference
      else
        render json: {error: @interview_reference.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete

      @interview_reference = InterviewReference.find(params[:id])

      @interview_reference.destroy

    end

end
