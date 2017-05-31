class SpecializationPolicy < AdminApplicationPolicy
  def permitted_attributes
    [
      :name,
      :klass_id,
      {:spell_ids => []}
    ]

  end
end
