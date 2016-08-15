module EventsHelper
	def check_attend_status (event_id)
	    @rsvp = AttendRsvp.where(:user_id => current_user, :event_id => event_id).first
	    if @rsvp.nil?
      		return true
    	end
    	return not(@rsvp.attending)
  	end
end
