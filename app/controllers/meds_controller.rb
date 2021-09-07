class MedsController < ApplicationController

  def index
    @meds = policy_scope(Med).order(created_at: :desc)
  end

  def show
    @med = Med.find(params[:id])
    authorize @med
  end

  def new
    @med = Med.new
    authorize @med
  end

  def create
    @med = Med.new(med_params)
    authorize @med
    @med.user = current_user
    @med.save
    if @med.save
      redirect_to med_path(@med)
    else
      render :new
    end
  end

  private

  def med_params
    params.require(:med).permit(:name, :description, :stock)
  end
end
