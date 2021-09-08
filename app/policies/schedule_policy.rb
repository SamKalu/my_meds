class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:med).where('meds.user': user)
    end
  end

  def new?
    true
  end

  def create?
    true
  end
end
