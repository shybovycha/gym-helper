class UsersController < ApplicationController
  before_action :set_user, except: :retrieve_auth_token

  def show
    @user = current_user
    @programs = @user.fetch_programs
    @excercise_presets = ExcercisePreset.all.map { |preset| [ preset.name, preset.name ] }

    # repetition times
    @repetitions = [ 1, 2, 3, 5, 7, 10, 15, 20, 25, 30 ].map { |r| [ r, r ] }

    # convert minutes to seconds
    @durations = [ 0.5, 1, 2, 3, 5, 10, 15, 20, 25, 30, 45, 60, 90 ].map { |k| (k * 60).to_i }
  end

  def save_program
    byebug
  end

  def retrieve_auth_token
    unless user_signed_in?
      session[:return_to] = retrieve_auth_token_path
      authenticate_user!
    end

    redirect_to "pebble://close#auth_token=#{current_user.auth_token}"
  end

  def fetch_programs
    programs = current_user.fetch_programs(present_as: :json)

    render json: programs
  end

  private

    def program_params
      params.require(:program).permit(:id)
    end

    def set_user
      auth_token = params[:auth_token]
      if auth_token.present?
        sign_in User.find_by_auth_token(auth_token)
      else
        authenticate_user!
      end
    end
end
