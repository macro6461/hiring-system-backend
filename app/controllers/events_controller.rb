class EventsController < ApplicationController

  def index
      @events = Event.all
      render json: @events
    end

    def show
      @event = Event.find(params[:id])
      render json: @event
    end

    def create
      byebug
      @event = Event.new(event_params)
      if @event.save
        render json: {event: @event}
      else
        render json: {error: @event.errors.messages.first}, status: 406
      end
    end

    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        render json: @event
      else
        render json: {error: @event.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete
      @event = Event.find(params[:id])
      @event.destroy
    end


    private

    def event_params
      params.permit(:title, :date, :description, :location)
    end

end
