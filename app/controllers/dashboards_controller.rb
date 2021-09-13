class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped
  layout "dashboard"

  def show
    @tab = "home" # this is to set the dashboard navtab-button get active
    @schedules = policy_scope(Schedule)
    @morning_schedules = []
    @afternoon_schedules = []
    @evening_schedules = []
    home_schedule
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
    @user = current_user
  end

  def edit_profile
    @tab = "profile"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  private

  def home_schedule
    midnight = Time.parse("00:00")
    midday = Time.parse("12:00")
    evening = Time.parse("18:00")
    @schedules.each do |schedule|
      schedule.times.each do |time|
        new_time = Time.parse(time)
        schedule = schedule.dup
        schedule.time = new_time
        if new_time > midnight && new_time < midday
          @morning_schedules << schedule
        elsif new_time > midday && new_time < evening
          @afternoon_schedules << schedule
        else
          @evening_schedules << schedule
        end
      end
    end
  end
end
