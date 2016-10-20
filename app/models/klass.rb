class Klass < ActiveRecord::Base
  has_many :specializations
  has_many :klass_spells
  has_many :spells, through: :klass_spells, inverse_of: :klasses
  has_one :character

  validates_presence_of :name

  def to_s
    "class"
  end
end
