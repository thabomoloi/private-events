class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @event_attendance = @event.event_attendances.new(user: current_user)
    if @event_attendance.save
      redirect_to @event, notice: "You have successfully registered for the event."
    else
      redirect_to @event, alert: "Unable to register for the event."
    end
  end

  def destroy
    @event_attendance = @event.event_attendances.find_by(user: current_user)
    if @event_attendance&.destroy
      redirect_to @event, notice: "You have successfully unregistered from the event."
    else
      redirect_to @event, alert: "Unable to unregister from the event."
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
