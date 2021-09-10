class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped
  layout "dashboard"

  def show
    @tab = "home" # this is to set the dashboard navtab-button get active
    @schedules = policy_scope(Schedule)
  end

  def treatments
    @tab = "treatments"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def inventory
    @tab = "meds"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def docs
    @tab = "docs"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def profile
    @tab = "profile"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def edit_profile
    @tab = "profile"
    skip_policy_scope # this should be deleted !!!!!!!
  end
end
