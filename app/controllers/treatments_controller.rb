class TreatmentsController < ApplicationController
  before_action :set_treatment, only: %i[show edit update destroy]

  def index
    @treatments = policy_scope(Treatment)
  end

  def new
    @treatment = Treatment.new
    authorize @treatment
  end

  def show
  end

  def create
    @treatment = Treatment.new(treatment_params)
    authorize @treatment
    @treatment.user = current_user
    @treatment.save
    if @treatment.save
      redirect_to treatments_path
    else
      render :new
    end
  end

  def edit
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
