class HomepageController < ApplicationController
  def index
    # TODO: at some point, search for the closest events given the player's information
    # Also make sure said events has end dates LATER than today
    # ALSO make sure event has a status that's either open_to_public or invite_only
    @events = Event.all
  end

  def show_event(event)
    return_flag = false
    if event.open_to_public?
      return_flag = true
    elsif event.invite_only? and get_role(event)
      return_flag = true
    end
  end

  def get_role(event)
    role = nil
    if current_user
      role = event.user_role_in_events.find_by(:user_id => current_user.id)
    end
    return role
  end
end
