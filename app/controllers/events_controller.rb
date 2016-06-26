class EventsController < ApplicationController
  before_filter :authorize_user, only: [:new, :create]
  before_filter :authorize_event_organizer, only: [:edit, :update]
  before_filter :authorize_event_owner, only: [:destroy, :new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        # create record of current user's role
        @role = UserRoleInEvent.new
        @role.user_id = current_user.id
        @role.event_id = @event.id
        @role.status = UserRoleInEvent.statuses[:owner]

        if @role.save
          # redirect
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_event_params
      # Require the name start time, end time, whether the submission is open, and status
      params.require(:event).permit(:name, :start, :end, :latitude, :longitude, :address)
    end

    def event_params
      # Require the name start time, end time, whether the submission is open, and status
      params.require(:event).permit(:name, :start, :end, :latitude, :longitude, :address, :description, :submission_grace_period, :submission_open, :header_image, :icon_image, :status)
    end

    def authorize_event_organizer
      if !current_user
        redirect_to '/login'
      elsif !current_user.admin?
        set_event
        role = @event.user_role_in_events.find_by_user(current_user)
        if !role
          redirect_to '/login'
        elsif !role.owner? and !role.organizer?
          redirect_to '/login'
        end
      end
    end

    def authorize_event_owner
      if !current_user
        redirect_to '/login'
      elsif !current_user.admin?
        set_event
        role = @event.user_role_in_events.find_by_user(current_user)
        if !role
          redirect_to '/login'
        elsif !role.owner?
          redirect_to '/login'
        end
      end
    end
end
