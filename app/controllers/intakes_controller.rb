class IntakesController < ApplicationController
  layout "dashboard", only: %i[index]

  def index
    @tab = "home"
    @intakes = policy_scope(Intake)
  end
end
