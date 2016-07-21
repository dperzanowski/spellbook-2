class CharacterPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name,
      :klass_id
    ]
  end
end
