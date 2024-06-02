class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  def show
    @past_events = current_user.attended_events.past
    @upcoming_events = current_user.attended_events.upcoming
  end

  private
end
