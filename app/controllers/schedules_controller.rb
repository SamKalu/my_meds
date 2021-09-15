class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[edit update destroy]
  layout "dashboard", only: %i[new edit]

  def new
    @treatment = Treatment.includes(:meds).find(params[:treatment_id])
    @meds = policy_scope(Med).with_attached_photo.where.not(id: @treatment.meds.pluck(:id))
    @schedule = Schedule.new
    authorize @schedule
    @tab = "treatments"
  end

  def create
    @meds = Med.where(id: params[:schedule][:med])
    @treatment = Treatment.find(params[:treatment_id])
    @meds.each do |med|
      @schedule = Schedule.new(schedules_params)
      @schedule.treatment = @treatment
      @schedule.med = med
      authorize @schedule
      @schedule.save
    end
    redirect_to treatment_path(@treatment)
    # if @schedule.save
    # else
    #   @meds = policy_scope(Med)
    #   render :new
    # end
  end

  def edit
    @meds = policy_scope(Med)
  end

  def update
    params[:schedule][:status] = params[:schedule][:status].to_i
    if @schedule.update(schedules_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to treatment_path(@schedule.treatment)
  end
  private

  def schedules_params
    params.require(:schedule).permit(:status, :med_id, times: [], weekdays: [])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end
end
