class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def impersonate?
    user.carer == record
  end

  def stop_impersonating?
    true
  end
end
