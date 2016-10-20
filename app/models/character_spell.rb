class CharacterSpell < ActiveRecord::Base
  belongs_to :character
  belongs_to :spell
end
