class UsersController < ApplicationController
  def show
    @events = current_user.events
    @past_events = current_user.attended_events.past
    @upcoming_events = current_user.attended_events.upcoming
  end
end
