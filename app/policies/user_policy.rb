class UserPolicy < AdminApplicationPolicy
  def permitted_attributes
    return [ :name,:admin ] if user.admin?
    [ :name ]
  end
end
