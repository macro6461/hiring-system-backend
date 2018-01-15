class RsvpReferencesController < ApplicationController
  def index
      @rsvp_references = RsvpReference.order("start_date asc")
      render json: @rsvp_references
    end

    def show
      @rsvp_reference = Event.find(params[:id])
      render json: @rsvp_references, include: ['company_lead_rsvps', 'trainer_lead_rsvps']
    end

    def create

      @rsvp_reference = Event.new(rsvp_reference_params)
      if @rsvp_reference.save
        render json: {rsvp_reference: @rsvp_reference}
      else
        render json: {error: @rsvp_reference.errors.messages.first}, status: 406
      end
    end

    def update
      @rsvp_reference = Event.find(params[:id])
      if @rsvp_reference.update(rsvp_reference_params)
        render json: @rsvp_reference
      else
        render json: {error: @rsvp_reference.errors.messages.first[1][0]}, status: 406
      end
    end

    def delete

      @rsvp_reference = Event.find(params[:id])

      @rsvp_reference.destroy

    end


    private

    def rsvp_reference_params
      params.permit(:title, :start_date, :end_date, :description, :location)
    end

end
