class EventsController < ApplicationController
    def index
        @events=Event.all
    end

    def show
        @event= current_user.events
    end
end
