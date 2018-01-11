class EventsController < ApplicationController

  def index
      @events = Event.order("start_date asc")
      render json: @events, include: ['company_lead_rsvps', 'trainer_lead_rsvps']
    end

    def show
      @event = Event.find(params[:id])
      render json: @events, include: ['company_lead_rsvps', 'trainer_lead_rsvps']
    end

    def create

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
      params.permit(:title, :start_date, :end_date, :description, :location)
    end

end
