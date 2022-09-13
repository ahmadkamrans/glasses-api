class GlassesPolicy < ApplicationPolicy
  def index?
    is_admin? || is_user?
  end

  def show?
    is_admin? || is_user?
  end

  def create?
    is_user? || true
  end

  def update?
    is_user?
  end

  def destroy?
    is_admin?
  end
end
