class TrainersController < ApplicationController

    def index
        options = 'trainer_leads', 'company_lead_interviews', 'trainer_lead_interviews'
        @trainers = Trainer.all.sort_by(&:updated_at)
        render json: @trainers, include: options
    end

    def show
      @trainer = Trainer.find(params[:id])
      render json: @trainer
    end

    def create
      @trainer = Trainer.where(:first_name => trainer_params[:first_name], :last_name => trainer_params[:last_name]).first_or_create do |trainer|
        trainer.email_address = trainer_params[:email_address]
        trainer.phone_number = trainer_params[:phone_number]
        trainer.url = trainer_params[:url]
        trainer.occupied = trainer_params[:occupied]
        trainer.hold = trainer_params[:hold]
      end

      if @trainer.save
        render json: {trainer: @trainer}
      else
        render json: {error: @trainer.errors.messages.first}, status: 406
      end
    end

    def update
      @trainer = Trainer.find(params[:id])
      if @trainer.update(trainer_params)
        render json: @trainer
      else
        render json: {error: @trainer.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @trainer = Trainer.find(params[:id])
      @trainer.destroy
    end


    private

    def trainer_params
      params.permit(:first_name, :last_name, :email_address, :phone_number, :url, :occupied, :hold)
    end

end
