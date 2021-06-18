class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_path(@event[:id])
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def update
    @event = Event.find(params(:id))
    if @event.update
      redirect_to event_path(@event[:id])
    else
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
    @attending_events = EventAttending.where(attended_event_id: Event.find(params[:id]))
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(current_user[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :details, :event_date)
  end
end
