class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]

  def new
    @treatment = Treatment.find(params[:treatment_id])
    @meds = policy_scope(Med)
    @schedule = Schedule.new
    authorize @schedule
  end

  def create
    @schedule = Schedule.new(schedules_params)
    @treatment = Treatment.find(params[:treatment_id])
    @schedule.treatment = @treatment
    authorize @schedule
    if @schedule.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def index
  end

  private

  def schedules_params
    params.require(:schedule).permit(:times, :weekdays, :med_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end
end
