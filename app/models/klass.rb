class Klass < ActiveRecord::Base
  has_many :specializations
  has_many :klass_spells
  has_many :spells, through: :klass_spells, inverse_of: :klasses
end
