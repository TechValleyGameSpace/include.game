class UsersController < ApplicationController
  before_filter :authorize_self, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(create_user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # FIXME: Since there are few fields, provide flash
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(update_user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
#  def destroy
#    @user.destroy
#    respond_to do |format|
#      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
#      format.json { head :no_content }
#    end
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_username(params[:username])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
    
    def update_user_params
      if !current_user and current_user.admin?
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :real_name, :longitude, :latitude, :description, :profile_image, :status)
      else
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :real_name, :longitude, :latitude, :description, :profile_image)
      end
    end
    
    def authorize_self
      # Check to see if the user is logged in
      if !current_user
        # if not, redirect to home
        redirect_to '/'
        
      # Check to see if the user is an admin
      elsif !current_user.admin?
        # If not, search for the user we're trying to access
        @user = User.find(params[:username])
        
        # Make sure the the logged in user is the same user we're trying to edit
        unless @user.id == current_user.id
          # if not, redirect to home
          redirect_to '/'
        end
      end
    end
end
