class UserRoleInEventsController < ApplicationController
  before_filter :authorize_user
  before_action :set_event
  before_action :set_user_role_in_event, only: [:edit, :update, :destroy]

  # GET /user_role_in_events/new
  def new
    @user_role_in_event = UserRoleInEvent.new
  end

  # GET /user_role_in_events/1/edit
  def edit
  end

  # POST /user_role_in_events
  # POST /user_role_in_events.json
  def create
    @user_role_in_event = UserRoleInEvent.new(user_role_in_event_params)

    respond_to do |format|
      @user_role_in_event.user_id ||= current_user.id
      @user_role_in_event.event_id = @event.id
      if @user_role_in_event.save
        format.html { redirect_to @user_role_in_event, notice: 'User role in event was successfully created.' }
        format.json { render :show, status: :created, location: @user_role_in_event }
      else
        format.html { render :new }
        format.json { render json: @user_role_in_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_role_in_events/1
  # PATCH/PUT /user_role_in_events/1.json
  def update
    respond_to do |format|
      if @user_role_in_event.update(user_role_in_event_params)
        format.html { redirect_to @user_role_in_event, notice: 'User role in event was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_role_in_event }
      else
        format.html { render :edit }
        format.json { render json: @user_role_in_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_role_in_events/1
  # DELETE /user_role_in_events/1.json
  def destroy
    @user_role_in_event.destroy
    respond_to do |format|
      format.html { redirect_to user_role_in_events_url, notice: 'User role in event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_role_in_event
      @user_role_in_event = UserRoleInEvent.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_in_event_params
      params.require(:user_role_in_event).permit(:message)
    end
end
