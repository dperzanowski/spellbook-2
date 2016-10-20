class Character < ActiveRecord::Base
  belongs_to :klass
  belongs_to :user

  has_many :character_spells
  has_many :spells, through: :character_spells, inverse_of: :characters

  validates_presence_of :name

  def to_s
    name
  end
end
