class FramePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
