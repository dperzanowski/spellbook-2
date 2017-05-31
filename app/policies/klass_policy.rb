class KlassPolicy < AdminApplicationPolicy
  def permitted_attributes
    [
      :name,
      {:spell_ids => []}
    ]
  end
end
