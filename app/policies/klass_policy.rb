class KlassPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name
    ]
  end
end
