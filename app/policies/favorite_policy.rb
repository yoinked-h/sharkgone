# frozen_string_literal: true

class FavoritePolicy < ApplicationPolicy
  def create?
    unbanned? && user.is_member?
  end

  def destroy?
    record.user_id == user.id
  end

  def rate_limit_for_write(**_options)
    { rate: 1.0 / 1.second, burst: 200 }
  end
end
