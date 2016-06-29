class SubmissionsController < ApplicationController
  # FIXME: only allow the owner, event organizer, or admin to destroy a submission
  before_filter :authorize_user, only: [:edit, :update, :destroy, :new, :create]
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    # Grab the event instance
    @event = Event.find(params[:event_id])
    @submission = Submission.new(:event_id => @event.id)
    @submission_form = [@event, @submission]
  end

  # GET /submissions/1/edit
  def edit
    @submission_form = @submission
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)

    # Grab the event instance
    @event = Event.find(params[:event_id])
    @submission.event_id = @event.id

    respond_to do |format|
      if @submission.save

        # create record of current user's role
        @role = UserRoleInSubmission.new
        @role.user_id = current_user.id
        @role.submission_id = @submission.id
        @role.status = UserRoleInSubmission.statuses[:owner]

        # Save this role
        if @role.save
          # redirect
          format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
          format.json { render :show, status: :created, location: @submission }
        else
          format.html { render :new }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      # Grab submission instance
      @submission = Submission.find(params[:id])

      # Grab the event instance
      @event = @submission.event

      # If the user is logged in, grab its role in the event
      @role = nil
      if current_user
        @role = @submission.user_role_in_submissions.find_by(:user_id => current_user.id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:name, :description, :status)
    end
end
