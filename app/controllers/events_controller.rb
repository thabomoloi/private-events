class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end
  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
