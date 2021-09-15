class IntakesController < ApplicationController
  layout "dashboard", only: %i[index]

  def index
    @tab = "home"
    @intakes = policy_scope(Intake)
  end

  def take
    @intake = Intake.find(params[:id])
    @intake.taken = true
    @intake.schedule.med.stock -= 1
    @intake.schedule.med.save
    authorize @intake
    @intake.save
    head 200
  end

  private

  def intake_params
    params.require(:intake).permit(:taken)
  end
end
