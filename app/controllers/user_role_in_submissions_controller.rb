class UserRoleInSubmissionsController < ApplicationController
  before_action :set_user_role_in_submission, only: [:edit, :update, :destroy]

  # GET /user_role_in_submissions/new
  def new
    @user_role_in_submission = UserRoleInSubmission.new
    @user_role_in_submission_form = [@submission, @user_role_in_submission]
  end

  # GET /user_role_in_submissions/1/edit
  def edit
    @user_role_in_submission_form = @user_role_in_submission
  end

  # POST /user_role_in_submissions
  # POST /user_role_in_submissions.json
  def create
    @user_role_in_submission = UserRoleInSubmission.new(user_role_in_submission_params)

    respond_to do |format|
      if @user_role_in_submission.save
        format.html { redirect_to @user_role_in_submission, notice: 'User role in submission was successfully created.' }
        format.json { render :show, status: :created, location: @user_role_in_submission }
      else
        format.html { render :new }
        format.json { render json: @user_role_in_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_role_in_submissions/1
  # PATCH/PUT /user_role_in_submissions/1.json
  def update
    respond_to do |format|
      if @user_role_in_submission.update(user_role_in_submission_params)
        format.html { redirect_to @user_role_in_submission, notice: 'User role in submission was successfully updated.' }
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
      format.html { redirect_to user_role_in_submissions_url, notice: 'User role in submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_role_in_submission
      @user_role_in_submission = UserRoleInSubmission.find(params[:id])
      @submission = Submission.find(params[:submission_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_in_submission_params
      params.fetch(:user_role_in_submission, {})
    end
end
