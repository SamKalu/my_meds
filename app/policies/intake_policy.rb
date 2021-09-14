class IntakePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def take?
    record.user == user
  end
end
