class ItemPolicy < ApplicationPolicy
  def new?
    user.admin? || record.collection.user_id == user.id
  end

  def create?
    new?
  end

  def update?
    user.admin? || record.collection.user_id == user.id
  end

  def destroy?
    user.admin? || record.collection.user_id == user.id
  end
end
