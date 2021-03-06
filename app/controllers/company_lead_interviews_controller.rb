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
      if company_lead_interview_params[:trainer_id]
        byebug
        @first_free_trainer = Trainer.find(company_lead_interview_params[:trainer_id])
        @reference = true
      else
        @reference = false
        @free_trainers = Trainer.all.where(:occupied=>false, :hold=>false).sort_by(&:updated_at)
        @first_free_trainer = @free_trainers.first
      end
      if !company_lead_interview_params[:company_lead_id]
        @company_lead = CompanyLead.where(:first_name=>company_lead_interview_params[:first_name], :last_name=>company_lead_interview_params[:last_name], :email_address=>company_lead_interview_params[:email_address]).first_or_create do |company_lead|
          company_lead.first_name = company_lead_interview_params[:first_name]
          company_lead.last_name = company_lead_interview_params[:last_name]
          company_lead.email_address = company_lead_interview_params[:email_address]
          company_lead.phone_number = company_lead_interview_params[:phone_number]
          company_lead.licensed = company_lead_interview_params[:licensed]
        end
        @title = "#{@company_lead.first_name} #{@company_lead.last_name} interview with #{@first_free_trainer.first_name} #{@first_free_trainer.last_name}"
        @company_lead_interview = CompanyLeadInterview.where(:company_lead_id=>@company_lead.id).first_or_create do |company_lead_interview|
          company_lead_interview.trainer_id = @first_free_trainer.id
          company_lead_interview.title =  @title
          company_lead_interview.date = company_lead_interview_params[:date]
          company_lead_interview.location =  "Bohemia Realty Group, 2101 Frederick Douglass Boulevard, New York, NY 10026"
          company_lead_interview.company_lead_id = @company_lead.id
          company_lead_interview.reference = @reference
          byebug
        end
      end
      if @company_lead_interview.save
        respond_to do |format|

          if @company_lead_interview.save
            # Tell the UserMailer to send a welcome email after save
            CompanyLeadInterviewMailer.with(@company_lead_interview).company_lead_interview(@company_lead_interview).deliver_now

            format.html
            # { redirect_to(@company_lead_interview, notice: 'Company Lead was successfully created.') }
            format.json
            # { render json: @company_lead_interview, status: :created, location: @company_lead_interview }

            # render json: {company_lead: @company_lead_interview}
          else
            format.html
            # { render action: 'new' }
            format.json
            # { render json: @company_lead_interview.errors, status: :unprocessable_entity }


            # render json: {error: @company_lead_interview.errors.messages.first}, status: 406
          end
        end

        render json: {company_lead_interview: @company_lead_interview}
      else
        render json: {error: @company_lead_interview.errors.messages.first}, status: 406
      end
    end

    def update
      let @free_trainers = Trainer.all.where(occupied: false)
      @trainer = Trainer.all.find(company_lead_interview_params[:trainer_id])
      @company_lead_interview = CompanyLeadInterview.find(params[:id])
      if !@free_trainers.include(@trainer)
        render json: {error: "trainer unavailable"}
      else
        if @company_lead_interview.update(title: company_lead_interview_params[:title], trainer_id: company_lead_interview_params[:trainer_id], date: company_lead_interview_params[:date], location: company_lead_interview_params[:location], company_lead_id: company_lead_interview_params[:company_lead_id])
          render json: @company_lead_interview
        else
          render json: {error: @company_lead_interview.errors.messages.first[1][0]}, status: 406
        end
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
