class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
  end

  def create
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Event updated successfully" 
      redirect_to events_path
    else
      flash[:notice] = "Event wasn't updated as expected" 
      redirect_to :back 
    end
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :details, :location)
  end


end
