class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped
  layout "dashboard"

  def show
    @tab = "home" # this is to set the dashboard navtab-button get active
    @schedules = policy_scope(Schedule)
    @meds = policy_scope(Med)
    @intakes = []
    generate_intakes
    @morning_intakes = []
    @afternoon_intakes = []
    @evening_intakes = []
    home_schedule
    # raise
  end

  def treatments
    @tab = "treatments"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def inventory
    @tab = "meds"
    skip_policy_scope # this should be deleted !!!!!!!
  end

  def documents
    @tab = "documents"
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
    @intakes.each do |intake|
      new_time = Time.parse(intake.due_date.strftime("%H:%M:%S"))
      if new_time > midnight && new_time < midday
        @morning_intakes << intake
      elsif new_time >= midday && new_time < evening
        @afternoon_intakes << intake
      else
        @evening_intakes << intake
      end
    end
  end

  def generate_intakes
    @schedules.each do |schedule|
      next unless schedule.weekdays.include?(Time.now.strftime("%A").downcase)

      schedule.times.each do |time|
        date_time = Time.zone.parse(time)
        @intakes << Intake.find_or_create_by(due_date: date_time, schedule: schedule)
      end
    end
  end
end

# def home_schedule (this section is no longer needed with the intakes table)
#   midnight = Time.parse("00:00")
#   midday = Time.parse("12:00")
#   evening = Time.parse("18:00")
#   @schedules.each do |schedule|
#     schedule.times.each do |time|
#       new_time = Time.parse(time)
#       schedule = schedule.dup
#       schedule.time = new_time
#       if new_time > midnight && new_time < midday
#         @morning_schedules << schedule
#       elsif new_time > midday && new_time < evening
#         @afternoon_schedules << schedule
#       else
#         @evening_schedules << schedule
#       end
#     end
#   end
# end

# schedule >> daily intake
# date_time = []
# iterate schedule.time
# Montrose.r(every: :week, on: :schedule.weekdays, at: Time.parse(time))
# r = Montrose.daily(between: (DateTime.now.beginning_of_day..DateTime.now.end_of_day), on: schedule.weekdays.reject(&:empty?).map(&:capitalize), at: Time.parse(time))
