class TrainersController < ApplicationController

  def index
      @trainers = Trainer.all
      render json: @trainers
    end

    def show
      @trainer = Trainer.find(params[:id])
      render json: @trainer
    end

    def create

      @trainer = Trainer.new(trainer_params)
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
