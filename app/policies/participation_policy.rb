class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    record.event.user == user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
  end
end
