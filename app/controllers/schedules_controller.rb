class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[edit update destroy]

  def new
    @treatment = Treatment.find(params[:treatment_id])
    @meds = policy_scope(Med)
    @schedule = Schedule.new
    authorize @schedule
  end

  def create
    clean_params
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

  def edit
    @meds = policy_scope(Med)
  end

  def update
    params[:schedule][:status] = params[:schedule][:status].to_i
    clean_params
    if @schedule.update(schedules_params)
      redirect_to dashboard_path
    else
      render :edit
    end

  end

  private

  def schedules_params
    params.require(:schedule).permit(:status, :med_id, times: [], weekdays: [] )
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end

  def clean_params
    params[:schedule][:times] = params[:schedule][:times].split(",")
    params[:schedule][:weekdays] = params[:schedule][:weekdays].split(",")
  end
end
