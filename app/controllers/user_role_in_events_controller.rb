class UserRoleInEventsController < ApplicationController
  before_filter :authorize_user
  before_action :set_can_edit_status
  before_action :set_user_role_in_event, only: [:edit, :update, :destroy]

  # GET /user_role_in_events/new
  def new
    # Update @can_edit_status
    update_can_edit_status
    @user_role_in_event = UserRoleInEvent.new(:event_id => @event.id)
    @user_role_in_event_form = [@event, @user_role_in_event]
  end

  # GET /user_role_in_events/1/edit
  def edit
    # Update @can_edit_status
    update_can_edit_status @user_role_in_event
    @user_role_in_event_form = @user_role_in_event
  end

  # POST /user_role_in_events
  # POST /user_role_in_events.json
  def create
    # Update @can_edit_status
    update_can_edit_status

    # Create a new event role
    @user_role_in_event = UserRoleInEvent.new(user_role_in_event_params)

    # Apply extra information, if there are any
    user = current_user
    white_listed_params = params.permit(:username)
    if white_listed_params[:username]
      user = User.find_by(:username => white_listed_params[:username])
    end
    @user_role_in_event.user_id ||= user.id
    @user_role_in_event.event_id = @event.id

    respond_to do |format|
      if @user_role_in_event.save
        format.html { redirect_to @event, notice: 'User signed in.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @user_role_in_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_role_in_events/1
  # PATCH/PUT /user_role_in_events/1.json
  def update
    # Update @can_edit_status
    update_can_edit_status @user_role_in_event
    respond_to do |format|
      if @user_role_in_event.update(user_role_in_event_params)
        format.html { redirect_to @event, notice: 'Message updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @user_role_in_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_role_in_events/1
  # DELETE /user_role_in_events/1.json
  def destroy
    # Update @can_edit_status
    update_can_edit_status @user_role_in_event
    @user_role_in_event.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'User role in event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_role_in_event
      @user_role_in_event = UserRoleInEvent.find(params[:id])
    end

    def set_can_edit_status
      # check if the current user can edit status messages
      @can_edit_status = false
      if current_user and current_user.admin?
        @can_edit_status = true
      end
    end

    def get_event
      returnEvent = nil
      if @user_role_in_event
        returnEvent = @user_role_in_event.event
      elsif params[:event_id]
        returnEvent = Event.find(params[:event_id])
      end
      return returnEvent
    end

    def update_can_edit_status(event_role = nil)
      # Check to see if the currently-logged-in user is the owner
      @event = get_event
      current_user_role = UserRoleInEvent.find_by(:event_id => @event.id, :user_id => current_user.id)
      if current_user_role and current_user_role.owner?
        if !event_role
          # if so, this user can edit status
          @can_edit_status = true
        elsif event_role != current_user_role
          # if so, this user can edit status
          @can_edit_status = true
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_in_event_params
      if @can_edit_status
        params.require(:user_role_in_event).permit(:message, :status)
      else
        params.require(:user_role_in_event).permit(:message)
      end
    end
end
