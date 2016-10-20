class CharacterPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name,
      :klass_id,
      :user_id,
      {:spell_ids => []}
    ]
  end
end
