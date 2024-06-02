class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    user = User.find(params[:user_id])
    @invitation = @event.invitations.new(user: user)
    if @invitation.save
      redirect_to @event, notice: "User has been invited."
    else
      redirect_to @event, alert: "Unable to invite user."
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
