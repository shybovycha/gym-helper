class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   respond_with(@user)
  # end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  # def destroy
  #   @user.destroy
  #   respond_with(@user)
  # end

  def fetch_programs
    user_id = program_params[:user_id]
    user = User.find(user_id)

    render json: user.programs
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email)
    end

    def program_params
      params.require(:user_id)
    end
end
