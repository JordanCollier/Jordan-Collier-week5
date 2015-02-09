class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = event.all
  end

  def show
  end

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]
    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:location_id])
  end

  def update
    if @event.update(event_params)
      redirect_to location_event_path, notice: 'Event was successfully updated.'
    end
  end

  def destroy
    if @event.destroy
      redirect_to root_path
    end

  end


private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :date, :requires_id )
  end
end
