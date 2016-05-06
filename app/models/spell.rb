class Spell < ActiveRecord::Base
  include PgSearch
  include Filterable
  multisearchable :against => [:name, :level, :school, :source]

  has_many :klass_spells
  has_many :klasses, through: :klass_spells, inverse_of: :spells
  
  has_many :specialization_spells
  has_many :specializations, through: :specialization_spells, inverse_of: :spells

  enum spell_levels: [
    "Cantrip",
    "Level 1",
    "Level 2",
    "Level 3",
    "Level 4",
    "Level 5",
    "Level 6",
    "Level 7",
    "Level 8",
    "Level 9",
  ]

  scope :level, -> (level) { where level: level }
  scope :school, -> (school) { where school: school }
  scope :source, -> (source) { where source: source }
  scope :ritual, -> (ritual) { where ritual: ritual }

  def print_level
    if self.level == 0
      return "Cantrip"
    else
      return "Level #{self.level}"
    end
  end
end
