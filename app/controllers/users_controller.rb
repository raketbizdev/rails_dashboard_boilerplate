class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :user_admin, :destroy]
  before_action :authenticate_user!
  # protect_from_forgery with: :null_session

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # def show
  # end

  # GET /users/new
  def new
    @user = User.new
  end

  def user_admin
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # # POST /users
  # # POST /users.json
  def create
    # @user = User.new(user_params)
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password]
    @user.add_role params[:roles]


    respond_to do |format|
      if @user.save
        format.html { redirect_to users_admin_index_path, success: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    @user.update_attribute(:email, params[:email])
    @user.update_attribute(:password, params[:password])
    @user.update_attribute(:password_confirmation, params[:password])
    @user.change_role params[:roles]

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_admin_index_path, success: 'user was successfully updated.' }
        format.json { render :edit, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /users/1
  # # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, success: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end