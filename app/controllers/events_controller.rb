class EventsController < ApplicationController
  before_action :find_event, only: [ :edit, :show ]
  before_action :event_params, only: [ :update ]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:notice] = 'Successfully created'
      redirect_to events_path
    else
      flash[:error] = "Something went wrong"
      render new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update

    find_event

    if @event.update event_params
      flash[:notice] = "Event updated successfully"
      redirect_to events_path
    else
      flash[:notice] = "Event wasn't updated as expected"
      render edit_event_path
    end
  end

  def destroy
  end

  private

  def event_params
     @params = params.require(:event).permit!
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
