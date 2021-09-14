class IntakesController < ApplicationController
  layout "dashboard", only: %i[index]

  def index
    @tab = "home"
    @intakes = policy_scope(Intake)
  end

  def update
    @intake = Intake.find(params[:id])
    @intake.update
    redirect_to dashboard_path
  end

  private

  def intake_params
    params.require(:intake).permit(:taken)
  end
end
