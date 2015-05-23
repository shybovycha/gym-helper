class ExcercisesController < ApplicationController
  before_action :set_excercise, only: [:show, :edit, :update, :destroy]

  def index
    @excercises = Excercise.all
    respond_with(@excercises)
  end

  def show
    respond_with(@excercise)
  end

  def new
    @excercise = Excercise.new
    respond_with(@excercise)
  end

  def edit
  end

  def create
    @excercise = Excercise.new(excercise_params)
    @excercise.save
    respond_with(@excercise)
  end

  def update
    @excercise.update(excercise_params)
    respond_with(@excercise)
  end

  def destroy
    @excercise.destroy
    respond_with(@excercise)
  end

  private
    def set_excercise
      @excercise = Excercise.find(params[:id])
    end

    def excercise_params
      params.require(:excercise).permit(:name, :duration, :repetitions)
    end
end
