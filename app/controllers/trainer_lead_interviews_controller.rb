class TrainerLeadInterviewsController < ApplicationController

  def index
      @trainer_lead_interviews = TrainerLeadInterview.all
      render json: @trainer_lead_interviews
    end

    def show
      @trainer_lead_interview = TrainerLeadInterview.find(params[:id])
      render json: @trainer_lead_interview
    end

    def create

      @free_trainers = Trainer.all.where(:occupied=>false, :hold=>false).sort_by(&:updated_at)
      @first_free_trainer = @free_trainers.first
      if !params[:trainer_lead_id]
        @trainer_lead = TrainerLead.where(:first_name=>trainer_lead_interview_params[:first_name], :last_name=>trainer_lead_interview_params[:last_name], :email_address=>trainer_lead_interview_params[:email_address]).first_or_create do |trainer_lead|
          trainer_lead.first_name = trainer_lead_interview_params[:first_name]
          trainer_lead.last_name = trainer_lead_interview_params[:last_name]
          trainer_lead.email_address = trainer_lead_interview_params[:email_address]
          trainer_lead.phone_number = trainer_lead_interview_params[:phone_number]
          trainer_lead.licensed = trainer_lead_interview_params[:licensed]
          trainer_lead.trainer_id = trainer_lead_interview_params[:trainer_id]
        end

        @title = "#{@trainer_lead.first_name} #{@trainer_lead.last_name} interview with #{@first_free_trainer.first_name} #{@first_free_trainer.last_name}"
        # @trainer_lead_interview = TrainerLeadInterview.where(title: @title, trainer_id: @first_free_trainer.id, date: trainer_lead_interview_params[:date], location: "Bohemia Realty Group, 2101 Frederick Douglass Boulevard, New York, NY 10026", trainer_lead_id: @trainer_lead.id)

        @trainer_lead_interview = TrainerLeadInterview.where(:trainer_lead_id=>@trainer_lead.id).first_or_create do |trainer_lead_interview|
          byebug
          trainer_lead_interview.trainer_id = @first_free_trainer.id
          trainer_lead_interview.title =  @title
          trainer_lead_interview.date = trainer_lead_interview_params[:date]
          trainer_lead_interview.location =  "Bohemia Realty Group, 2101 Frederick Douglass Boulevard, New York, NY 10026"
          trainer_lead_interview.trainer_lead_id = @trainer_lead.id
        end
      end
      if @trainer_lead_interview.save
        respond_to do |format|

          if @trainer_lead_interview.save
            # Tell the UserMailer to send a welcome email after save
            TrainerLeadInterviewMailer.with(@trainer_lead_interview).trainer_lead_interview(@trainer_lead_interview).deliver_now

            format.html
            # { redirect_to(@trainer_lead_interview, notice: 'Trainer Lead was successfully created.') }
            format.json
            # { render json: @trainer_lead_interview, status: :created, location: @trainer_lead_interview }

            # render json: {trainer_lead: @trainer_lead_interview}
          else
            format.html
            # { render action: 'new' }
            format.json
            # { render json: @trainer_lead_interview.errors, status: :unprocessable_entity }


            # render json: {error: @trainer_lead_interview.errors.messages.first}, status: 406
          end
        end

        render json: {trainer_lead_interview: @trainer_lead_interview}
      else
        render json: {error: @trainer_lead_interview.errors.messages.first}, status: 406
      end
    end

    def update
      @trainer_lead_interview = TrainerLeadInterview.find(params[:id])
      if @trainer_lead_interview.update(params)
        render json: @trainer_lead_interview
      else
        render json: {error: @trainer_lead_interview.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @trainer_lead_interview = TrainerLeadInterview.find(params[:id])
      @trainer_lead_interview.destroy
    end


    private

    def trainer_lead_interview_params
      params.permit(:title, :interview_trainer_id, :trainer_id, :date, :location, :notes, :email_address, :first_name, :last_name, :phone_number, :licensed, :trainer_lead_interview=>{})
    end

end
