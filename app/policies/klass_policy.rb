class KlassPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name,
      {:spell_ids => []}
    ]
  end
end
