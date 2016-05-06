class SpecializationPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name,
      :klass_id,
      {:spell_ids => []}
    ]

  end
end
