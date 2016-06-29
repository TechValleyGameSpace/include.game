class EventsController < ApplicationController
  before_filter :authorize_user, only: [:new, :create]
  before_filter :authorize_event_organizer, only: [:edit, :update]
  before_filter :authorize_event_owner, only: [:destroy]
  before_filter :authorize_event_status, only: [:show]
  before_action :set_event, only: [:show, :edit, :update]

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
    @role = nil

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

  def can_edit_submission?(event, event_role, submission)
    return_flag = false
    submission_status = Event::submissions_status(event)

    # Make sure we're evaluating a submission, and the status is either opened or closed
    if submission and (submission_status != Event::SUBMISSION_CLOSED)
      if event_role and (event_role.organizer? or event_role.owner?)
        # Event owners and organizers have access to submissions at all times
        return_flag = true
      elsif current_user
        if current_user.admin?
          # Admins have access to submissions at all times
          return_flag = true
        elsif submission.users.contains(current_user) and (submission_status == Event::SUBMISSION_OPEN)
          # Regular users that developed this game has access ONLY if the submission is open
          return_flag = true
        end
      end
    end
    return return_flag
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      # Grab the event instance
      @event = Event.find(params[:id])

      # If the user is logged in, grab its role in the event
      @role = nil
      if current_user
        @role = @event.user_role_in_events.find_by(:user_id => current_user.id)
      end
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
        unless @role and (@role.owner? or @role.organizer?)
          redirect_to '/login'
        end
      end
    end

    def authorize_event_owner
      if !current_user
        redirect_to '/login'
      elsif !current_user.admin?
        set_event
        unless @role and @role.owner?
          redirect_to '/login'
        end
      end
    end

    def authorize_event_status
      set_event
      if @event.draft?
        authorize_event_organizer
      elsif @event.invite_only?
        redirect_to '/login' unless current_user or @role
      end
    end
end
