# frozen_string_literal: true

class AIMetadataPolicy < ApplicationPolicy
  def create_or_update?
    unbanned?
  end

  def undo?
    create_or_update?
  end

  def revert?
    create_or_update?
  end

  def rate_limit_for_write(**_options)
    { rate: 5.0 / 1.second, burst: 50 }
  end

  def permitted_attributes
    %i[prompt negative_prompt]
  end
end
