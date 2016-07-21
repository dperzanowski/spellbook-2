class CharacterPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name,
    ]
  end
end
