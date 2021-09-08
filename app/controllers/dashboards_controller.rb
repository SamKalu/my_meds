class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def show
    @schedules = policy_scope(Schedule)
  end

  def treatments
  end

  def inventory
  end

  def docs
  end

  def profile
  end
end
