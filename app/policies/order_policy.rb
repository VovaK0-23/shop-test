class OrderPolicy < ApplicationPolicy
  def create?
    true
  end

  def confirm?
    true
  end
end
