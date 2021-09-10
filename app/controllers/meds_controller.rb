class MedsController < ApplicationController
  before_action :set_med, only: %i[show edit update destroy]
  layout "dashboard", only: %i[index new edit create]

  def index
    @tab = "meds"
    @meds = policy_scope(Med).order(created_at: :desc)
  end

  def show
    @tab = "meds"
  end

  def new
    @tab = "meds"
    @med = Med.new
    authorize @med
  end

  def create
    @tab = "meds"
    @med = Med.new(med_params)
    authorize @med
    @med.user = current_user
    @med.save
    if @med.save
      redirect_to meds_path
    else
      render :new
    end
  end

  def edit
    @tab = "meds"
  end

  def update
    if @med.update(med_params)
      redirect_to @med
    else
      render :edit
    end
  end

  def destroy
    @med.destroy
    redirect_to meds_path
  end

  private

  def med_params
    params.require(:med).permit(:name, :description, :stock)
  end

  def set_med
    @med = Med.find(params[:id])
    authorize @med
  end
end
