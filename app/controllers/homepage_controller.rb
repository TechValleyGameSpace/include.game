class HomepageController < ApplicationController
  def index
    # TODO: at some point, search for the closest events given the player's information
    @events = Event.all
  end
end
