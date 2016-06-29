class UserRoleInSubmissionsController < ApplicationController
  before_filter :authorize_owner, only: [:new, :create]
  before_filter :authorize_self, only: [:edit, :update, :destroy]
  before_action :set_can_edit_status
  before_action :set_user_role_in_submission, only: [:edit, :update, :destroy]

  # GET /user_role_in_submissions/new
  def new
    # Update @can_edit_status
    update_can_edit_status
    @user_role_in_submission = UserRoleInSubmission.new(:submission_id => @submission.id)

    # Update form
    @user_role_in_submission_form = [@submission, @user_role_in_submission]
  end

  # GET /user_role_in_submissions/1/edit
  def edit
    # Update @can_edit_status
    update_can_edit_status @user_role_in_submission

    # Update form
    @user_role_in_submission_form = @user_role_in_submission
  end

  # POST /user_role_in_submissions
  # POST /user_role_in_submissions.json
  def create
    # Update @can_edit_status
    update_can_edit_status

    # Create a new event role
    @user_role_in_submission = UserRoleInSubmission.new(user_role_in_submission_params)

    # Make sure the submission is set
    @user_role_in_submission.submission_id = @submission.id

    # Update the submission form
    @user_role_in_submission_form = [@submission, @user_role_in_submission]

    respond_to do |format|
      # Apply extra information, if there are any
      user = nil
      white_listed_params = params.permit(:username)
      if white_listed_params[:username]
        user = User.find_by(:username => white_listed_params[:username])
      else
        flash[:error] = "Username is required"
        format.html { render :new }
        format.json { render json: @user_role_in_submission.errors, status: :unprocessable_entity }
      end
      if user
        @user_role_in_event.user_id = user.id
        if @user_role_in_submission.save
          format.html { redirect_to @submission, notice: 'User role in submission was successfully created.' }
          format.json { render :show, status: :created, location: @user_role_in_submission }
        else
          format.html { render :new }
          format.json { render json: @user_role_in_submission.errors, status: :unprocessable_entity }
        end
      else
        flash[:error] = "Did not find username, #{white_listed_params[:username]}"
        format.html { render :new }
        format.json { render json: @user_role_in_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_role_in_submissions/1
  # PATCH/PUT /user_role_in_submissions/1.json
  def update
    # Update the submission form
    @user_role_in_submission_form = @user_role_in_submission
    respond_to do |format|
      if @user_role_in_submission.update(user_role_in_submission_params)
        format.html { redirect_to @submission, notice: 'User role in submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_role_in_submission }
      else
        format.html { render :edit }
        format.json { render json: @user_role_in_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_role_in_submissions/1
  # DELETE /user_role_in_submissions/1.json
  def destroy
    @user_role_in_submission.destroy
    respond_to do |format|
      format.html { redirect_to @submission, notice: 'User role in submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize_owner
      if !current_user
        # Force them to login
        redirect_to '/login'
      elsif !current_user.admin?
        # get user role in submission
        submission = Submissions.find(params[:submission_id])
        role = submission.user_role_in_submissions.find_by(:user_id => current_user.id)
        unless role and role.owner?
          # If the current use
          redirect_to submission
        end
      end
    end

    def authorize_self
      if !current_user
        # Force them to login
        redirect_to '/login'
      elsif !current_user.admin?
        # get user role in submission
        set_user_role_in_submission

        # Check if the current user is editing their own role
        unless @user_role_in_submission.user_id == current_user.id
          # If not, grab their role in the submission
          user_role = @submission.user_role_in_submissions.find_by(:user_id => current_user.id)
          unless user_role.owner?
            # If not the owner of this submission, redirect to the submission
            redirect_to @submission
          end
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_role_in_submission
      @user_role_in_submission = UserRoleInSubmission.find(params[:id])
      @submission = @user_role_in_submission.submission
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_in_submission_params
      if @can_edit_status
        params.require(:user_role_in_submission).permit(:role, :status)
      else
        params.require(:user_role_in_submission).permit(:role)
      end
    end

    def set_can_edit_status
      # check if the current user can edit status messages
      @can_edit_status = false
      if current_user and current_user.admin?
        @can_edit_status = true
      end
    end

    def get_submission
      return_submission = nil
      if @user_role_in_submission
        return_submission = @user_role_in_submission.submission
      elsif params[:submission_id]
        return_submission = Submission.find(params[:submission_id])
      end
      return return_submission
    end

    def update_can_edit_status(submission_role = nil)
      # Check to see if the currently-logged-in user is the owner
      @submission = get_submission
      current_user_role = UserRoleInSubmission.find_by(:submission_id => @submission.id, :user_id => current_user.id)
      if current_user_role and current_user_role.owner?
        if !submission_role
          # if so, this user can edit status
          @can_edit_status = true
        elsif submission_role != current_user_role
          # if so, this user can edit status
          @can_edit_status = true
        end
      end
    end
end
