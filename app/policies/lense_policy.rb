class LensePolicy < ApplicationPolicy
  def index?
    is_admin? || is_user?
  end

  def show?
    is_admin? || is_user?
  end

  def create?
    is_admin?
  end

  def update?
    is_admin?
  end

  def destroy?
    is_admin?
  end
end
