class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def show
    @schedules = policy_scope(Schedule)
  end

  def treatments
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def inventory
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def docs
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def profile
    skip_policy_scope # this should be deleted !!!!!!!
  end
end
