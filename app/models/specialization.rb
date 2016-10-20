class Specialization < ActiveRecord::Base
  belongs_to :klass

  has_many :specialization_spells
  has_many :spells, through: :specialization_spells, inverse_of: :specializations

  validates_presence_of :name

  def to_s
    "specialization"
  end
end
