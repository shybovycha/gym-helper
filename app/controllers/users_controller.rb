class UsersController < ApplicationController
  before_action :authenticate_user!

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

  def fetch_programs
    programs = current_user.fetch_programs(present_as: :json)

    render json: programs
  end

  private

    def program_params
      params.require(:program).permit(:id)
    end
end
