class EventAttendingsController < ApplicationController
    
    def create 
        if EventAttending.where(attended_event_id: Event.find(params[:event_id]), attendee_id: current_user.id).exists?
            return
        end
        @event_attending = Event.find(params[:event_id]).event_attendings.build(attendee_id: current_user.id)
        

        if @event_attending.save 
            redirect_to user_path(current_user[:id])
        end
    end
end
