class SpecializationSpell < ActiveRecord::Base
  belongs_to :specialization
  belongs_to :spell
end
