class SpellPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :name,
      :level,
      :ritual,
      :school,
      :components,
      :source,
      :description,
      :created_at,
      :updated_at,
      :casting_time,
      :range,
      :duration,
    ]

  end
end
