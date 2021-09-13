class TreatmentsController < ApplicationController
  before_action :set_treatment, only: %i[show edit update destroy]

  layout "dashboard", only: %i[index new show edit create]

  def index
    @tab = "treatments"
    @treatments = policy_scope(Treatment)
  end

  def new
    @tab = "treatments"
    @treatment = Treatment.new
    @meds = policy_scope(Med)
    authorize @treatment
  end

  def show
    @tab = "treatments"
  end

  def create
    @tab = "treatments"
    @treatment = Treatment.new(treatment_params)
    authorize @treatment
    @treatment.user = current_user
    @treatment.save
    if @treatment.save
      redirect_to treatment_path(@treatment)
    else
      render :new
    end
  end

  def edit
    @tab = "treatments"
  end

  def update
    if @treatment.update(treatment_params)
      redirect_to @treatment
    else
      render :edit
    end
  end

  def destroy
    @treatment.destroy
    redirect_to treatments_path
  end

  private

  def treatment_params
    params.require(:treatment).permit(:name)
  end

  def set_treatment
    @treatment = Treatment.find(params[:id])
    authorize @treatment
  end
end
