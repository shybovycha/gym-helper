class ExcercisePresetsController < ApplicationController
  before_action :set_excercise_preset, only: [:show, :edit, :update, :destroy]

  def index
    @excercise_presets = ExcercisePreset.all
    respond_with(@excercise_presets)
  end

  def show
    respond_with(@excercise_preset)
  end

  def new
    @excercise_preset = ExcercisePreset.new
    respond_with(@excercise_preset)
  end

  def edit
  end

  def create
    @excercise_preset = ExcercisePreset.new(excercise_preset_params)
    @excercise_preset.save
    respond_with(@excercise_preset)
  end

  def update
    @excercise_preset.update(excercise_preset_params)
    respond_with(@excercise_preset)
  end

  def destroy
    @excercise_preset.destroy
    respond_with(@excercise_preset)
  end

  private
    def set_excercise_preset
      @excercise_preset = ExcercisePreset.find(params[:id])
    end

    def excercise_preset_params
      params.require(:excercise_preset).permit(:name)
    end
end
